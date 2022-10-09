import 'package:dartz/dartz.dart' hide Order;
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../entities/order.dart';
import '../repositories/user_orders_repository.dart';

@LazySingleton()
class PlaceOrder extends UseCase<Order, PlaceOrderParams> {
  final UserOrdersRepository _repository;

  PlaceOrder(this._repository);
  @override
  Future<Either<Failure, Order>> call({required PlaceOrderParams params}) {
    return _repository.placeOrder(params);
  }
}
