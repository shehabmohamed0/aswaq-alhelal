// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ref_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefCityModel _$RefCityModelFromJson(Map<String, dynamic> json) => RefCityModel(
      id: json['id'] as String? ?? '',
      country: json['country'] as String,
      governate: json['governate'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$RefCityModelToJson(RefCityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'governate': instance.governate,
    };
