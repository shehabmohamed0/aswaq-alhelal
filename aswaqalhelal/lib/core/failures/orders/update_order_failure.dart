import 'package:aswaqalhelal/features/orders/domain/entities/order.dart';
import 'package:root_package/core/failures/failure.dart';

class UpdateOrderFailure extends Failure {
  final String message;
  final Order newOrder;
  UpdateOrderFailure(this.message, this.newOrder);
}