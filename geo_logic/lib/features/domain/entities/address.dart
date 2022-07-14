import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

import 'geo_point.dart';

class Address extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final String country;
  @JsonKey()
  final String governate;
  @JsonKey()
  final String city;
  @JsonKey()
  final String district;
  @JsonKey()
  final String description;

  final GeoPoint geoPoint;

  const Address({
    required this.id,
    required this.country,
    required this.governate,
    required this.city,
    required this.district,
    required this.description,
    required this.geoPoint,
  });

  @override
  List<Object?> get props =>
      [id, country, governate, city, district, geoPoint, description];
}
