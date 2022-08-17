import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/geo_point.dart';

part 'geo_point_model.g.dart';

@JsonSerializable()
class GeoPointModel extends GeoPoint {
  const GeoPointModel({required double lat, required double long})
      : super(lat: lat, long: long);

  factory GeoPointModel.fromJson(Map<String, dynamic> json) =>
      _$GeoPointModelFromJson(json);

  /// Connect the generated [_$GeoPointToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GeoPointModelToJson(this);
}
