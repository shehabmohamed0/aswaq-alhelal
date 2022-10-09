import '../../../domain/entities/order.dart';

class UserOrdersEvent {
  UserOrdersEvent();
}

class UserOrdersRequested extends UserOrdersEvent {
  final String id;

  UserOrdersRequested(this.id);
}

class OrderCanceled extends UserOrdersEvent {
  final Order order;

  OrderCanceled(this.order);
}
