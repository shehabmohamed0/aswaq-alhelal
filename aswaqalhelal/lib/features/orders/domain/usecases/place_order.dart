import 'package:dartz/dartz.dart' hide Order;
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

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
