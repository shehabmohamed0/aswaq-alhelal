import 'package:aswaqalhelal/core/json_converters/time_stamp_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:aswaqalhelal/core/json_converters/time_stamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/order.dart';
import 'order_item_model.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true, converters: [TimestampConverter()])
class OrderModel extends Order {
  @JsonKey(name: 'items')
  final List<OrderItemModel> itemsModels;

  const OrderModel(
      {required super.id,
      required super.from,
      required super.institutionOwnerId,
      required super.to,
      required super.name,
      required super.phoneNumber,
      required this.itemsModels,
      required super.totalPrice,
      super.editorId,
      super.sellerId,
      super.distributorId,
      super.collectorId,
      required super.orderState,
      required super.creationTime,
      required super.orderNumber})
      : super(items: itemsModels);

  factory OrderModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = OrderModel.fromJson(document.data()!);

    return address.copyWith(id: document.id);
  }
  OrderModel copyWith({String? id, OrderState? orderState}) => OrderModel(
      id: id ?? this.id,
      from: from,
      itemsModels: itemsModels,
      to: to,
      institutionOwnerId: institutionOwnerId,
      name: name,
      phoneNumber: phoneNumber,
      totalPrice: totalPrice,
      editorId: editorId,
      sellerId: sellerId,
      distributorId: distributorId,
      collectorId: collectorId,
      orderState: orderState ?? this.orderState,
      creationTime: creationTime,
      orderNumber: orderNumber);
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  /// Connect the generated [_$ReceiptModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  factory OrderModel.fromDomain(Order order) => OrderModel(
      id: order.id,
      from: order.from,
      institutionOwnerId: order.institutionOwnerId,
      to: order.to,
      name: order.name,
      phoneNumber: order.phoneNumber,
      itemsModels: order.items.map(OrderItemModel.fromDomain).toList(),
      totalPrice: order.totalPrice,
      orderState: order.orderState,
      editorId: order.editorId,
      distributorId: order.distributorId,
      sellerId: order.sellerId,
      collectorId: order.collectorId,
      creationTime: order.creationTime,
      orderNumber: order.orderNumber);
}
