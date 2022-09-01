import 'package:bloc/bloc.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/form_inputs/minimum_lenght_string.dart';
import 'package:root_package/core/form_inputs/required_object.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../../core/params/addresses/add_address_params.dart';
import '../../../../../core/params/addresses/update_address_params.dart';
import '../../../../address_suggestions/domain/entities/entities.dart';
import '../../../../address_suggestions/presentation/DTOs/ref_address_details.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';

part 'add_edit_address_state.dart';

@injectable
class AddEditAddressCubit extends Cubit<AddEditAddressState> {
  AddEditAddressCubit(this._addAddress, this._updateAddress)
      : super(const AddEditAddressState());
  final AddAddress _addAddress;
  final UpdateAddress _updateAddress;

  void initEdit(Address address) {
    final fullAddressDetails = FullAddressDetails.fromAddress(address);

    emit(state.copyWith(
      oldAddressDetails: RequiredObject.dirty(fullAddressDetails),
      refAddressDetails:
          RequiredObject.dirty(fullAddressDetails.refAddressDetails),
      description: state.description.dirty(address.description),
      geoPoint: RequiredObject.dirty(address.geoPoint),
    ));
  }

  void addressDetailsChanged(RefAddressDetails refAddressDetails) {
    emit(state.copyWith(
        refAddressDetails: RequiredObject.dirty(refAddressDetails)));
  }

  void deleteAddressDetails() {
    emit(state.copyWith(refAddressDetails: const RequiredObject.dirty(null)));
  }

  void descriptionchanged(String val) {
    emit(state.copyWith(description: state.description.dirty(val)));
  }

  void geoPointChanged(GeoPoint geoPoint) {
    emit(state.copyWith(geoPoint: RequiredObject.dirty(geoPoint)));
  }

  Future<void> submit({String? id}) async {
    if (state.status == AddEditAddressStatus.loading) return;

    emit(state.copyWith(status: AddEditAddressStatus.loading));
    if (id == null) {
      await _add();
    } else {
      await _update(id);
    }
  }

  Future<void> _add() async {
    final addressDetails = state.refAddressDetails.value!;
    final geoPoint = state.geoPoint.value!;
    final description = state.description.value;
    final either = await _addAddress(
        params: AddAddressParams(
      country: 'egypt',
      governateId: addressDetails.refGovernate.id,
      governate: addressDetails.refGovernate.name,
      cityId: addressDetails.refCity.id,
      city: addressDetails.refCity.name,
      neighborhoodId: addressDetails.refNeighborhood.id,
      neighborhood: addressDetails.refNeighborhood.name,
      description: description,
      geoPoint: geoPoint,
    ));

    either.fold((failure) {
      failure as ServerFailure;
      emit(state.copyWith(
        errorMessage: failure.message,
        status: AddEditAddressStatus.failure,
      ));
    }, (address) {
      emit(state.copyWith(
        address: address,
        status: AddEditAddressStatus.success,
      ));
    });
  }

  Future<void> _update(String id) async {
    final addressDetails = state.refAddressDetails.value!;
    final geoPoint = state.geoPoint.value!;
    final description = state.description.value;
    final either = await _updateAddress(
        params: UpdateAddressParams(
      id: id,
      country: 'egypt',
      governateId: addressDetails.refGovernate.id,
      governate: addressDetails.refGovernate.name,
      cityId: addressDetails.refCity.id,
      city: addressDetails.refCity.name,
      neighborhoodId: addressDetails.refNeighborhood.id,
      neighborhood: addressDetails.refNeighborhood.name,
      description: description,
      geoPoint: geoPoint,
    ));

    either.fold((failure) {
      failure as ServerFailure;
      emit(state.copyWith(
        errorMessage: failure.message,
        status: AddEditAddressStatus.failure,
      ));
    }, (address) {
      emit(state.copyWith(
        address: address,
        status: AddEditAddressStatus.success,
      ));
    });
  }
}
