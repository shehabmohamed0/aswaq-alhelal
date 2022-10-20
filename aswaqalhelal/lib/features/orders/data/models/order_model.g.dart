// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String? ?? '',
      from: json['from'] as String,
      institutionOwnerId: json['institutionOwnerId'] as String,
      to: json['to'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      itemsModels: (json['items'] as List<dynamic>)
          .map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      editorId: json['editorId'] as String?,
      sellerId: json['sellerId'] as String?,
      distributorId: json['distributorId'] as String?,
      collectorId: json['collectorId'] as String?,
      orderState: $enumDecode(_$OrderStateEnumMap, json['orderState']),
      creationTime: const TimestampConverter()
          .fromJson(json['creationTime'] as Timestamp),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'institutionOwnerId': instance.institutionOwnerId,
      'to': instance.to,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'totalPrice': instance.totalPrice,
      'creationTime': const TimestampConverter().toJson(instance.creationTime),
      'editorId': instance.editorId,
      'sellerId': instance.sellerId,
      'distributorId': instance.distributorId,
      'collectorId': instance.collectorId,
      'orderState': _$OrderStateEnumMap[instance.orderState]!,
      'items': instance.itemsModels.map((e) => e.toJson()).toList(),
    };

const _$OrderStateEnumMap = {
  OrderState.pending: 'pending',
  OrderState.processing: 'processing',
  OrderState.shipping: 'shipping',
  OrderState.completed: 'completed',
  OrderState.declined: 'declined',
  OrderState.canceled: 'canceled',
};
