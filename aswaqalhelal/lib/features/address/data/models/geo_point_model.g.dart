// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_point_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoPointModel _$GeoPointModelFromJson(Map<String, dynamic> json) =>
    GeoPointModel(
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$GeoPointModelToJson(GeoPointModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };
