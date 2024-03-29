import 'package:aswaqalhelal/core/form_inputs/required_object.dart';
import 'package:bloc/bloc.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/form_inputs/minimum_lenght_string.dart';
import '../../../../../core/params/addresses/add_address_params.dart';
import '../../../../../core/params/addresses/update_address_params.dart';
import '../../../../address_suggestions/domain/entities/entities.dart';
import '../../../../address_suggestions/presentation/DTOs/ref_address_details.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/update_main_address.dart';
import '../../../domain/usecases/usecases.dart';

part 'add_edit_address_state.dart';

@injectable
class AddEditAddressCubit extends Cubit<AddEditAddressState> {
  AddEditAddressCubit(
      this._addAddress, this._updateAddress, this._updateMainAddress)
      : super(const AddEditAddressState());
  final AddAddress _addAddress;
  final UpdateAddress _updateAddress;
  final UpdateMainAddress _updateMainAddress;

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

  Future<void> submit({String? id, required bool isMain}) async {
    if (state.status == AddEditAddressStatus.loading) return;

    emit(state.copyWith(status: AddEditAddressStatus.loading));
    if (id == null) {
      await _add();
    } else {
      await _update(id, isMain);
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

  Future<Either<Failure, Address>> _updateMethod(
      {required bool isMain, required UpdateAddressParams params}) async {
    return isMain
        ? await _updateMainAddress(params: params)
        : await _updateAddress(params: params);
  }

  Future<void> _update(String id, bool isMain) async {
    final addressDetails = state.refAddressDetails.value!;
    final geoPoint = state.geoPoint.value!;
    final description = state.description.value;
    final either = await _updateMethod(
        isMain: isMain,
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
