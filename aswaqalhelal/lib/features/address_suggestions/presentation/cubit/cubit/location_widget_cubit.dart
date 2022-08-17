import 'package:bloc/bloc.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/packages/app_settings.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../../core/failures/address/location_failure.dart';
import '../../../../address/domain/entities/geo_point.dart';
import '../../../../address/domain/usecases/get_current_location.dart';

part 'location_widget_state.dart';

@injectable
class LocationWidgetCubit extends Cubit<LocationWidgetState> {
  LocationWidgetCubit(this._getCurrentLocation)
      : super(const LocationWidgetState());
  final GetCurrentLocation _getCurrentLocation;

  void geoPointChanged(GeoPoint geoPoint) {
    emit(state.copyWith(geoPointOrNull: some(geoPoint)));
  }

  Future<void> getCurrentLocation() async {
    if (state.status == LocationWidgetStatus.loading) {
      return;
    }
    emit(state.copyWith(status: LocationWidgetStatus.loading));
    final either = await _getCurrentLocation(params: NoArgsParams());
    either.fold(
      (failure) {
        if (failure is LocationDeniedFailure) {
          emit(state.copyWith(status: LocationWidgetStatus.denied));
        } else if (failure is LocationDeniedForeverFailure) {
          emit(
            state.copyWith(
              status: LocationWidgetStatus.deniedForever,
              errorMessage: failure.message,
            ),
          );
          AppSettings.openLocationSettings();
        } else if (failure is ServerFailure) {}
      },
      (GeoPoint geoPoint) => emit(state.copyWith(
          geoPointOrNull: some(geoPoint), status: LocationWidgetStatus.loaded)),
    );
  }
}
