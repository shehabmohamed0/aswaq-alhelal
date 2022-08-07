// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ref_governate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefGovernateModel _$RefGovernateModelFromJson(Map<String, dynamic> json) =>
    RefGovernateModel(
      id: json['id'] as String? ?? '',
      country: json['country'] as String,
      governate: json['governate'] as String,
    );

Map<String, dynamic> _$RefGovernateModelToJson(RefGovernateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country': instance.country,
      'governate': instance.governate,
    };
