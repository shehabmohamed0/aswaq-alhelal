// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ref_district_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefNeighborhoodModel _$RefNeighborhoodModelFromJson(
        Map<String, dynamic> json) =>
    RefNeighborhoodModel(
      id: json['id'] as String? ?? '',
      country: json['country'] as String,
      governate: json['governate'] as String,
      city: json['city'] as String,
      neighborhood: json['neighborhood'] as String,
    );

Map<String, dynamic> _$RefNeighborhoodModelToJson(
        RefNeighborhoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'governate': instance.governate,
      'city': instance.city,
      'neighborhood': instance.neighborhood,
    };
