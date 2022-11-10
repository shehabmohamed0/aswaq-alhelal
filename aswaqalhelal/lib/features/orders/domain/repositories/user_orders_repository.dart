import 'package:root_package/root_package.dart' hide Order;

import '../../data/models/order_item_model.dart';
import '../../data/models/order_model.dart';
import '../entities/order.dart';
import '../entities/order_item.dart';

abstract class UserOrdersRepository {
  Future<Either<Failure, Stream<List<Order>>>> getOrders(
      GetUserOrdersParams params);
  Future<Either<Failure, Order>> placeOrder(PlaceOrderParams params);
}

class GetUserOrdersParams {
  final String id;
  final Order? order;

  GetUserOrdersParams({
    required this.id,
    this.order,
  });
}

class PlaceOrderParams {
  final List<OrderItem> orderItems;
  final double totalPrice;
  final OrderState orderState;
  final String from;
  final String institutionOwnerId;
  final String to;
  final String name;
  final String phoneNumber;
  final String? editorId;
  final String? sellerId;
  PlaceOrderParams(
      {required this.orderItems,
      required this.totalPrice,
      required this.orderState,
      required this.from,
      required this.institutionOwnerId,
      required this.to,
      required this.name,
      required this.phoneNumber,
      required this.editorId,
      required this.sellerId});

  OrderModel toModel(String id, int orderNumber) => OrderModel(
      id: id,
      itemsModels: orderItems.map(OrderItemModel.fromDomain).toList(),
      totalPrice: totalPrice,
      orderState: orderState,
      from: from,
      institutionOwnerId: institutionOwnerId,
      to: to,
      name: name,
      phoneNumber: phoneNumber,
      editorId: editorId,
      sellerId: sellerId,
      creationTime: DateTime.now(),
      orderNumber: orderNumber);
}
