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
      imageUrl: json['imageUrl'] as String?,
      creationTime: const TimestampConverter()
          .fromJson(json['creationTime'] as Timestamp),
      unitModels: (json['units'] as List<dynamic>)
          .map((e) => UnitModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReferenceItemModelToJson(ReferenceItemModel instance) =>
    <String, dynamic>{
      'institutionId': instance.institutionId,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'creationTime': const TimestampConverter().toJson(instance.creationTime),
      'id': instance.id,
      'units': instance.unitModels,
    };
