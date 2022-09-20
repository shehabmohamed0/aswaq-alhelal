// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String,
      cartItemModels: (json['cartItemModels'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      institutionId: json['institutionId'] as String,
      userId: json['userId'] as String,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderState: $enumDecode(_$OrderStateEnumMap, json['orderState']),
      creationTime: DateTime.parse(json['creationTime'] as String),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'institutionId': instance.institutionId,
      'userId': instance.userId,
      'totalPrice': instance.totalPrice,
      'orderState': _$OrderStateEnumMap[instance.orderState]!,
      'creationTime': instance.creationTime.toIso8601String(),
      'cartItemModels': instance.cartItemModels.map((e) => e.toJson()).toList(),
    };

const _$OrderStateEnumMap = {
  OrderState.pending: 'pending',
  OrderState.processing: 'processing',
  OrderState.shipping: 'shipping',
  OrderState.completed: 'completed',
};
