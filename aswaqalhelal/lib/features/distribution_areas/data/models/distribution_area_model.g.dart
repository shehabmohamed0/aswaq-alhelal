// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributionAreaModel _$DistributionAreaModelFromJson(
        Map<String, dynamic> json) =>
    DistributionAreaModel(
      id: json['id'] as String? ?? '',
      parentId: json['parentId'] as String,
      country: json['country'] as String,
      governate: json['governate'] as String,
      city: json['city'] as String?,
      neighborhood: json['neighborhood'] as String?,
    );

Map<String, dynamic> _$DistributionAreaModelToJson(
        DistributionAreaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'country': instance.country,
      'governate': instance.governate,
      'city': instance.city,
      'neighborhood': instance.neighborhood,
    };
