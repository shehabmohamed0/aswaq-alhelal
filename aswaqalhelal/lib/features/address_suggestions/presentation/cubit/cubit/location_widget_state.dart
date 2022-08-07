part of 'location_widget_cubit.dart';

enum LocationWidgetStatus { initial, loading, loaded, denied, deniedForever }

class LocationWidgetState extends Equatable {
  final Option<GeoPoint> geoPointOrNull;
  final LocationWidgetStatus status;
  final String? errorMessage;
  const LocationWidgetState(
      {this.geoPointOrNull = const None<GeoPoint>(),
      this.status = LocationWidgetStatus.initial,
      this.errorMessage});

  LocationWidgetState copyWith(
          {Option<GeoPoint>? geoPointOrNull,
          LocationWidgetStatus? status,
          String? errorMessage}) =>
      LocationWidgetState(
          geoPointOrNull: geoPointOrNull ?? this.geoPointOrNull,
          status: status ?? this.status,
          errorMessage: this.errorMessage);

  @override
  List<Object?> get props => [geoPointOrNull, status, errorMessage];
}
