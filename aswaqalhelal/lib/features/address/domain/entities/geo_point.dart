import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

class GeoPoint extends Equatable {
  @JsonKey()
  final double lat;
  @JsonKey()
  final double long;
  const GeoPoint({required this.lat, required this.long});

  @override
  List<Object?> get props => [lat, long];
}
