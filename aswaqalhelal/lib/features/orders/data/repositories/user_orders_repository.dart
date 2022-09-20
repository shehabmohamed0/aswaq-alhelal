import 'package:root_package/root_package.dart' hide Order;

import '../../../institution_items/data/models/cart_item_model.dart';
import '../../../institution_items/data/models/institution_item_model.dart';
import '../../../institution_items/data/models/unit_model.dart';
import '../../../institution_items/domain/entities/cart_item.dart';
import '../../domain/entities/order.dart';
import '../models/order_model.dart';

abstract class UserOrdersRepository {
  Future<Either<Failure, List<Order>>> getOrders();
  Future<Either<Failure, Order>> placeOrder();
}

class PlaceOrderParams {
  final List<CartItem> cartItems;
  final String institutionId;
  final String userId;
  final double totalPrice;
  final OrderState orderState;

  PlaceOrderParams({
    required this.cartItems,
    required this.institutionId,
    required this.userId,
    required this.totalPrice,
    required this.orderState,
  });

  OrderModel toModel(String id) => OrderModel(
      id: id,
      cartItemModels: cartItems
          .map((cartItem) => CartItemModel(
              id: cartItem.id,
              itemModel: InstitutionItemModel(
                  id: cartItem.item.id,
                  institutionId: cartItem.item.institutionId,
                  referenceId: cartItem.item.referenceId,
                  name: cartItem.item.name,
                  imageUrl: cartItem.item.imageUrl,
                  creationTime: cartItem.item.creationTime,
                  unitModels: cartItem.item.units
                      .map((e) => UnitModel(
                          referenceId: e.referenceId,
                          name: e.name,
                          quantity: e.quantity,
                          price: e.price))
                      .toList()),
              selectedUnitModel: UnitModel(
                  referenceId: cartItem.selectedUnit.referenceId,
                  name: cartItem.selectedUnit.name,
                  quantity: cartItem.selectedUnit.quantity,
                  price: cartItem.selectedUnit.price),
              quantity: cartItem.quantity))
          .toList(),
      institutionId: institutionId,
      userId: userId,
      totalPrice: totalPrice,
      orderState: orderState,
      creationTime: DateTime.now());
}
