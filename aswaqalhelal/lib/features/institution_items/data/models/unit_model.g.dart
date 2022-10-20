// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitModel _$UnitModelFromJson(Map<String, dynamic> json) => UnitModel(
      referenceId: json['referenceId'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      baseUnitModel: json['baseUnit'] == null
          ? null
          : UnitModel.fromJson(json['baseUnit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnitModelToJson(UnitModel instance) => <String, dynamic>{
      'referenceId': instance.referenceId,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'baseUnit': instance.baseUnitModel,
    };
