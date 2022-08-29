import 'package:aswaqalhelal/features/address/domain/entities/entities.dart';
import 'package:aswaqalhelal/features/address/domain/usecases/add_first_address.dart';
import 'package:aswaqalhelal/features/address_suggestions/presentation/DTOs/ref_address_details.dart';
import 'package:bloc/bloc.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/form_inputs/minimum_lenght_string.dart';
import 'package:root_package/core/form_inputs/required_object.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../../core/params/addresses/add_address_params.dart';

part 'add_first_address_state.dart';

@lazySingleton
class AddFirstAddressCubit extends Cubit<AddFirstAddressState> {
  AddFirstAddressCubit(this._addFirstAddress) : super(AddFirstAddressState());
  final AddFirstAddress _addFirstAddress;

  void addressDetailsChanged(RefAddressDetails refAddressDetails) {
    emit(state.copyWith(
        refAddressDetails: RequiredObject.dirty(refAddressDetails)));
  }

  void deleteAddressDetails() {
    emit(state.copyWith(refAddressDetails: RequiredObject.dirty(null)));
  }

  void descriptionchanged(String val) {
    emit(state.copyWith(description: state.description.dirty(val)));
  }

  void geoPointChanged(GeoPoint geoPoint) {
    emit(state.copyWith(geoPoint: RequiredObject.dirty(geoPoint)));
  }

  Future<void> submit({String? id}) async {
    if (state.status == FormzStatus.submissionInProgress) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final addressDetails = state.refAddressDetails.value!;
    final geoPoint = state.geoPoint.value!;
    final description = state.description.value;
    final either = await _addFirstAddress(
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

    either.fold(
        (failure) => emit(
              state.copyWith(
                  errorMessage: (failure as ServerFailure).message,
                  status: FormzStatus.submissionFailure),
            ),
        (address) =>
            emit(state.copyWith(status: FormzStatus.submissionSuccess)));
  }
}
