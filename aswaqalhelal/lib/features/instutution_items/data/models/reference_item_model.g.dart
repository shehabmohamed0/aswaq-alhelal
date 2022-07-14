// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferenceItemModel _$ReferenceItemModelFromJson(Map<String, dynamic> json) =>
    ReferenceItemModel(
      id: json['id'] as String? ?? '',
      institutionId: json['institutionId'] as String,
      name: json['name'] as String,
      unitModels: (json['units'] as List<dynamic>)
          .map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReferenceItemModelToJson(ReferenceItemModel instance) =>
    <String, dynamic>{
      'institutionId': instance.institutionId,
      'name': instance.name,
      'id': instance.id,
      'units': instance.unitModels,
    };
