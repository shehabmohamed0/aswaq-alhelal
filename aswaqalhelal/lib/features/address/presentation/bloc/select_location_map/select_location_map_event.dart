part of 'select_location_map_bloc.dart';

@immutable
abstract class SelectLocationMapEvent {}

class InitLocation extends SelectLocationMapEvent {
  final GeoPoint geoPoint;
  InitLocation(this.geoPoint);
}

class CameraMoveStarted extends SelectLocationMapEvent {}

class CameraMoving extends SelectLocationMapEvent {
  final CameraPosition position;
  CameraMoving(this.position);
}

class CameraIdle extends SelectLocationMapEvent {}

class GetUserLocation extends SelectLocationMapEvent {}
