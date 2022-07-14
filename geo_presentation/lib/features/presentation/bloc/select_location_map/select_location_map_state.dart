part of 'select_location_map_bloc.dart';

class SelectLocationMapState extends Equatable {
  final LatLng position;
  final MapStatus mapStatus;
  const SelectLocationMapState({
    this.position = const LatLng(30.0444, 31.2357),
    this.mapStatus = MapStatus.cameraIdle,
  });

  SelectLocationMapState copyWith({
    LatLng? position,
    MapStatus? mapStatus,
  }) {
    return SelectLocationMapState(
      position: position ?? this.position,
      mapStatus: mapStatus ?? this.mapStatus,
    );
  }

  @override
  List<Object> get props => [position, mapStatus];
}

enum MapStatus {
  cameraMoving,
  cameraIdle,
  locationSelected,
  locationInit,
}
