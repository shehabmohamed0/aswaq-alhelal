// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: json['id'] as String? ?? '',
      itemModel:
          InstitutionItemModel.fromJson(json['item'] as Map<String, dynamic>),
      selectedUnitModel:
          UnitModel.fromJson(json['selectedUnit'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$CartItemModelToJson(CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'item': instance.itemModel.toJson(),
      'selectedUnit': instance.selectedUnitModel.toJson(),
    };
