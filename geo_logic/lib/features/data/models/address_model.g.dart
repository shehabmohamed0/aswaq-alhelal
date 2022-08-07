// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      id: json['id'] as String? ?? '',
      country: json['country'] as String,
      governate: json['governate'] as String,
      city: json['city'] as String,
      neighborhood: json['neighborhood'] as String,
      description: json['description'] as String,
      geoPointModel:
          GeoPointModel.fromJson(json['geoPoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'governate': instance.governate,
      'city': instance.city,
      'neighborhood': instance.neighborhood,
      'description': instance.description,
      'geoPoint': instance.geoPointModel.toJson(),
    };
