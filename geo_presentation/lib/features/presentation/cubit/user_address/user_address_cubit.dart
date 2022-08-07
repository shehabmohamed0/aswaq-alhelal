import 'package:geo_logic/core/firebase/firebase_path.dart';
import 'package:geo_logic/core/params/addresses/add_address_params.dart';
import 'package:geo_logic/core/params/addresses/update_address_params.dart';
import 'package:geo_logic/features/domain/usecases/add_address.dart';
import 'package:geo_logic/features/domain/usecases/get_country.dart';
import 'package:geo_logic/features/domain/usecases/get_current_location.dart';
import 'package:geo_logic/features/domain/usecases/remove_address.dart';
import 'package:geo_logic/features/domain/usecases/update_address.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/packages/injectable.dart';

import '../base_address/base_address_cubit.dart';

@injectable
class UserAddressCubit extends BaseAddressCubit {
  final AddAddress _addAddress;
  final UpdateAddress _updateAddress;

  UserAddressCubit(
    this._addAddress,
    this._updateAddress,
    GetCountry getCountry,
    GetCurrentLocation getCurrentLocation,
    RemoveAddress removeAddress,
  ) : super(
          getCountry,
          getCurrentLocation,
          removeAddress,
        );

  @override
  Future<void> addAction(state) async {
    final either = await _addAddress(
        params: AddAddressParams(
      country: state.country.enName,
      governate: state.governate.value!.enName,
      city: state.city.value!.enName,
      neighborhood: state.neighborhood.value,
      description: state.description.value,
      geoPoint: state.geoPoint.value!,
      collectionPath: FirebasePath.userAddresses,
    ));
    either.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: failure.message,
            ),
          );
        }
      },
      (address) => emit(AddAddressAddedState(address: address)),
    );
  }

  @override
  Future<void> editAction(addressId, state) async {
    final either = await _updateAddress(
      params: UpdateAddressParams(
        id: addressId,
        country: state.country.enName,
        governate: state.governate.value!.enName,
        city: state.city.value!.enName,
        neighborhood: state.neighborhood.value,
        description: state.description.value,
        geoPoint: state.geoPoint.value!,
      ),
    );
    either.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: failure.message,
          ));
        }
      },
      (address) {
        emit(AddAddressUpdatedState(address: address));
      },
    );
  }
}
