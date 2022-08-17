import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

import 'geo_point.dart';

class Address extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final String country;
  @JsonKey()
  final String governateId;
  @JsonKey()
  final String governate;
  @JsonKey()
  final String cityId;
  @JsonKey()
  final String city;
  @JsonKey()
  final String neighborhoodId;
  @JsonKey()
  final String neighborhood;
  @JsonKey()
  final String description;

  final GeoPoint geoPoint;

  const Address({
    required this.id,
    required this.country,
    required this.governateId,
    required this.governate,
    required this.cityId,
    required this.city,
    required this.neighborhoodId,
    required this.neighborhood,
    required this.description,
    required this.geoPoint,
  });

  @override
  List<Object?> get props => [
        id,
        country,
        governate,
        governateId,
        city,
        cityId,
        neighborhood,
        neighborhoodId,
        geoPoint,
        description
      ];
}
