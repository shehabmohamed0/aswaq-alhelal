import 'package:aswaqalhelal/features/orders/domain/entities/order.dart';
import 'package:root_package/root_package.dart' hide Order;

abstract class InstitutionOrdersRepository {
  Future<Either<Failure, List<Order>>> getOrders(
      GetInstitutionOrdersParams params);

  Future<Either<Failure, Order>> updateOrders(
      UpdateInstitutionOrderParams params);
}

class GetInstitutionOrdersParams {
  final String institutionId;
  final List<OrderState> whereIn;
  final Order? order;

  GetInstitutionOrdersParams({
    required this.institutionId,
    required this.whereIn,
    this.order,
  });
}

class UpdateInstitutionOrderParams {
  final String institutionId;
  final Order order;
  final OrderState orderState;
  UpdateInstitutionOrderParams({
    required this.institutionId,
    required this.order,
    required this.orderState,
  });
}