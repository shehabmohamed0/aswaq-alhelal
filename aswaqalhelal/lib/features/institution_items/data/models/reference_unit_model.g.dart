// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferenceUnitModel _$ReferenceUnitModelFromJson(Map<String, dynamic> json) =>
    ReferenceUnitModel(
      id: json['id'] as String,
      name: json['name'] as String,
      institutionId: json['institutionId'] as String,
      creationTime: const TimestampConverter()
          .fromJson(json['creationTime'] as Timestamp),
    );

Map<String, dynamic> _$ReferenceUnitModelToJson(ReferenceUnitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'institutionId': instance.institutionId,
      'creationTime': const TimestampConverter().toJson(instance.creationTime),
    };
