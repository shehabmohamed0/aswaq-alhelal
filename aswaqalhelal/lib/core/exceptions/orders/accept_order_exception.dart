import 'package:aswaqalhelal/features/orders/domain/entities/order.dart';

class AcceptOrderException implements Exception {
  final Order newOrder;

  AcceptOrderException(this.newOrder);
}
