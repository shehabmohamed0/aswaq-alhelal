// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) =>
    OrderItemModel(
      itemModel:
          InstitutionItemModel.fromJson(json['item'] as Map<String, dynamic>),
      unitModel: UnitModel.fromJson(json['unit'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'price': instance.price,
      'item': instance.itemModel.toJson(),
      'unit': instance.unitModel.toJson(),
    };
