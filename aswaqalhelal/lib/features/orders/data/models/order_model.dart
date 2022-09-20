import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../../institution_items/data/models/cart_item_model.dart';
import '../../domain/entities/order.dart';

part 'order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderModel extends Order {
  final List<CartItemModel> cartItemModels;
  const OrderModel({
    required super.id,
    required this.cartItemModels,
    required super.institutionId,
    required super.userId,
    required super.totalPrice,
    required super.orderState,
    required super.creationTime,
  }) : super(cartItems: cartItemModels);

  factory OrderModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = OrderModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  OrderModel _copyWithId(String id) => OrderModel(
        id: id,
        cartItemModels: cartItemModels,
        institutionId: institutionId,
        userId: userId,
        totalPrice: totalPrice,
        orderState: orderState,
        creationTime: creationTime,
      );
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  /// Connect the generated [_$OrderModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
