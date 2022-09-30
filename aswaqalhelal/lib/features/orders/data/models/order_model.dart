import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/json_converters/time_stamp_converter.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/order.dart';
import 'order_item_model.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true, converters: [TimestampConverter()])
class OrderModel extends Order {
  @JsonKey(name: 'items')
  final List<OrderItemModel> itemsModels;
  const OrderModel({
    required super.id,
    required super.from,
    required super.to,
    required this.itemsModels,
    required super.totalPrice,
    super.editorId,
    super.sellerId,
    super.distributorId,
    super.collectorId,
    required super.orderState,
    required super.creationTime,
  }) : super(items: itemsModels);

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
        totalPrice: totalPrice,
        editorId: editorId,
        sellerId: sellerId,
        distributorId: distributorId,
        collectorId: collectorId,
        orderState: orderState ?? this.orderState,
        creationTime: creationTime,
      );
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  /// Connect the generated [_$ReceiptModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  factory OrderModel.fromDomain(Order order) => OrderModel(
        id: order.id,
        from: order.from,
        to: order.to,
        itemsModels: order.items.map(OrderItemModel.fromDomain).toList(),
        totalPrice: order.totalPrice,
        orderState: order.orderState,
        editorId: order.editorId,
        distributorId: order.distributorId,
        sellerId: order.sellerId,
        collectorId: order.collectorId,
        creationTime: order.creationTime,
      );
}
