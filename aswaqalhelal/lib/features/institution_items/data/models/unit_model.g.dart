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
      p0: (json['p0'] as num?)?.toDouble(),
      p1: (json['p1'] as num?)?.toDouble(),
      p2: (json['p2'] as num?)?.toDouble(),
      p3: (json['p3'] as num?)?.toDouble(),
      p4: (json['p4'] as num?)?.toDouble(),
      baseUnitModel: json['baseUnit'] == null
          ? null
          : UnitModel.fromJson(json['baseUnit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnitModelToJson(UnitModel instance) => <String, dynamic>{
      'referenceId': instance.referenceId,
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'p0': instance.p0,
      'p1': instance.p1,
      'p2': instance.p2,
      'p3': instance.p3,
      'p4': instance.p4,
      'baseUnit': instance.baseUnitModel?.toJson(),
    };
