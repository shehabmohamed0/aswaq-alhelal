import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geo_logic/core/failures/location_failure.dart';
import 'package:geo_logic/core/params/addresses/add_address_params.dart';
import 'package:geo_logic/core/params/addresses/delete_address_params.dart';
import 'package:geo_logic/core/params/addresses/update_address_params.dart';
import 'package:geo_logic/features/domain/entities/address.dart';
import 'package:geo_logic/features/domain/entities/country.dart';
import 'package:geo_logic/features/domain/entities/geo_point.dart';
import 'package:geo_logic/features/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/form_inputs/required_object.dart';
import 'package:root_package/core/form_inputs/required_string.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/packages/app_settings.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/packages/injectable.dart';

part 'base_address_state.dart';


abstract class BaseAddressCubit extends Cubit<AddAddressState> {
  final GetCountry _getCountry;
  final GetCurrentLocation _getCurrentLocation;
  final RemoveAddress _removeAddress;

  BaseAddressCubit(
    this._getCountry,
    this._getCurrentLocation,
    this._removeAddress,
  ) : super(const AddAddressInitialState());

  Future<void> init() async {
    await _initCountryData(
      (country) {
        emit(AddAddressLoadedState(country: country));
      },
    );
  }

  FutureOr<void> initEdit(Address address) async {
    await _initCountryData((country) {
      final governate = country.governates[address.governate]!;
      final city = governate.cities[address.city];
      emit(
        AddAddressLoadedState(
          country: country,
          governate: RequiredObject<Governate>.dirty(governate),
          city: RequiredObject<City>.dirty(city),
          district: RequiredString.dirty(address.district),
          description: RequiredString.dirty(address.description),
          geoPoint: RequiredObject.dirty(address.geoPoint),
          status: FormzStatus.valid,
          isEdit: true,
        ),
      );
    });
  }

  Future<void> _initCountryData(
    Function(Country) onGetCountry,
  ) async {
    final either = await _getCountry(params: NoArgsParams());
    either.fold(
      (failed) {},
      (country) {
        onGetCountry(country);
      },
    );
  }

  void governateChanged(Governate governate) {
    final newGovernate = RequiredObject.dirty(governate);
    emit((state as AddAddressLoadedState).copyWith(governate: newGovernate));
  }

  void cityChanged(City city) {
    final newCity = RequiredObject.dirty(city);
    emit((state as AddAddressLoadedState).copyWith(city: newCity));
  }

  void districtChanged(String district) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final newDistict = RequiredString.dirty(district);
    emit((state as AddAddressLoadedState).copyWith(district: newDistict));
  }

  void descriptionChanged(String description) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final newDescription = RequiredString.dirty(description);
    emit(
        (state as AddAddressLoadedState).copyWith(description: newDescription));
  }

  Future<void> getCurrentLocation() async {
    final current = state as AddAddressLoadedState;
    if (current.geoPointLoading) {
      return;
    }
    emit(current.copyWith(geoPointLoading: true));
    final either = await _getCurrentLocation(params: NoArgsParams());
    either.fold(
      (failure) {
        if (failure is LocationDeniedFailure) {
          emit(current.copyWith(geoPointLoading: false));
        } else if (failure is LocationDeniedForeverFailure) {
          emit(
            current.copyWith(
              status: FormzStatus.submissionCanceled,
              geoPointLoading: false,
              errorMessage: failure.message,
            ),
          );
          AppSettings.openLocationSettings();
        } else if (failure is ServerFailure) {}
      },
      (geoPoint) => emit(current.copyWith(
          geoPoint: RequiredObject.dirty(geoPoint), geoPointLoading: false)),
    );
  }

  void geoPointChanged(GeoPoint geoPoint) {
    final current = state as AddAddressLoadedState;
    emit(current.copyWith(geoPoint: RequiredObject.dirty(geoPoint)));
  }

  Future<void> addAction(AddAddressLoadedState state);
  Future<void> editAction(String addressId, AddAddressLoadedState state);

  Future<void> addressSubmitted([String? addressId]) async {
    final current = state as AddAddressLoadedState;

    final status = Formz.validate([
      current.governate,
      current.city,
      current.district,
      current.description,
      current.geoPoint,
    ]);

    if (status == FormzStatus.valid) {
      emit(current.copyWith(status: FormzStatus.submissionInProgress));
      if (!current.isEdit) {
        await addAction(current);
      } else {
        await editAction(addressId!, current);
      }
    } else {
      emit(
        current.copyWith(
          governate: RequiredObject.dirty(current.governate.value),
          city: RequiredObject.dirty(current.city.value),
          district: RequiredString.dirty(current.district.value),
          description: RequiredString.dirty(current.description.value),
          geoPoint: RequiredObject.dirty(current.geoPoint.value),
          status: status,
        ),
      );
    }
  }

  void addAddressEditInitCompleted() {
    emit((state as AddAddressLoadedState).copyWith(initEdit: true));
  }

  Future<void> deleteAddress(String id) async {
    final current = state as AddAddressLoadedState;
    emit(current.copyWith(status: FormzStatus.submissionInProgress));
    final either =
        await _removeAddress(params: RemoveAddressParams(addressId: id));

    either.fold((failure) {
      if (failure is ServerFailure) {
        emit((state as AddAddressLoadedState).copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: failure.message));
      }
    }, (addressId) {
      emit(AddAddressDeletedState(id: addressId));
    });
  }
}
