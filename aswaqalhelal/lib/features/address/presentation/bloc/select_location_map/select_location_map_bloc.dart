import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/packages/app_settings.dart';
import 'package:root_package/packages/bloc_concurrency.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/packages/stream_transform.dart';

import '../../../../../core/failures/address/location_failure.dart';
import '../../../domain/entities/geo_point.dart';
import '../../../domain/usecases/get_current_location.dart';

part 'select_location_map_event.dart';
part 'select_location_map_state.dart';

EventTransformer<E> throttleRestarable<E>() {
  return (events, mapper) {
    return restartable<E>()
        .call(events.throttle(const Duration(milliseconds: 300)), mapper);
  };
}

@injectable
class SelectLocationMapBloc
    extends Bloc<SelectLocationMapEvent, SelectLocationMapState> {
  final GetCurrentLocation _getCurrentLocation;

  SelectLocationMapBloc(this._getCurrentLocation)
      : super(const SelectLocationMapState()) {
    on<InitLocation>(_onInitLocation);
    on<CameraMoveStarted>(_onCameraMoveStarted);
    on<CameraMoving>(_onCameraMoving, transformer: throttleRestarable());
    on<CameraIdle>(_onCameraIdle);
    on<GetUserLocation>(_onGetUserLocation);
  }

  FutureOr<void> _onCameraMoveStarted(
      CameraMoveStarted event, Emitter<SelectLocationMapState> emit) {
    emit(state.copyWith(mapStatus: MapStatus.cameraMoving));
  }

  FutureOr<void> _onCameraMoving(
      CameraMoving event, Emitter<SelectLocationMapState> emit) {
    emit(state.copyWith(
      position: event.position.target,
      mapStatus: MapStatus.cameraMoving,
    ));
  }

  FutureOr<void> _onCameraIdle(
      CameraIdle event, Emitter<SelectLocationMapState> emit) {
    emit(state.copyWith(mapStatus: MapStatus.cameraIdle));
  }

  FutureOr<void> _onGetUserLocation(
      GetUserLocation event, Emitter<SelectLocationMapState> emit) async {
    final either = await _getCurrentLocation(params: NoArgsParams());

    either.fold((failure) {
      if (failure is LocationDeniedFailure) {
      } else if (failure is LocationDeniedForeverFailure) {
        AppSettings.openLocationSettings();
      } else if (failure is ServerFailure) {}
    }, (geoPoint) {
      emit(state.copyWith(
        position: LatLng(geoPoint.lat, geoPoint.long),
        mapStatus: MapStatus.locationSelected,
      ));
    });
  }

  FutureOr<void> _onInitLocation(
      InitLocation event, Emitter<SelectLocationMapState> emit) {
    emit(
      state.copyWith(
          position: LatLng(event.geoPoint.lat, event.geoPoint.long),
          mapStatus: MapStatus.locationInit),
    );
  }
}
