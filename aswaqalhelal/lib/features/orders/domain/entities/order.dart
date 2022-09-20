import 'package:root_package/packages/equatable.dart';

import '../../../institution_items/domain/entities/cart_item.dart';

class Order extends Equatable {
  final String id;
  final List<CartItem> cartItems;
  final String institutionId;
  final String userId;
  final double totalPrice;
  final OrderState orderState;
  final DateTime creationTime;
  const Order({
    required this.id,
    required this.cartItems,
    required this.institutionId,
    required this.userId,
    required this.totalPrice,
    required this.orderState,
    required this.creationTime,
  });

  @override
  List<Object?> get props =>
      [id, cartItems, institutionId, userId, totalPrice, orderState, creationTime];
}

//كلية تكتولوجيا قسم رقابة جودة
enum OrderState {
  pending,
  processing,
  shipping,
  completed;

  @override
  String toString() {
    switch (this) {
      case OrderState.pending:
        return 'Pending';
      case OrderState.processing:
        return 'Processing';
      case OrderState.shipping:
        return 'Shipping';
      case OrderState.completed:
        return 'Completed';
    }
  }
}
