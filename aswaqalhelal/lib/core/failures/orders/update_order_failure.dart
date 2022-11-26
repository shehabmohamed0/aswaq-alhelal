import '../../../features/orders/domain/entities/order.dart';
import '../failure.dart';

class UpdateOrderFailure extends Failure {
  final Order newOrder;
  const UpdateOrderFailure(super.message, this.newOrder);
}
