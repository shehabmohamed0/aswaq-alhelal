import 'package:dartz/dartz.dart' hide Order;
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/order.dart';
import '../repositories/user_orders_repository.dart';

@LazySingleton()
class GetUserOrders extends UseCase<Stream<List<Order>>, GetUserOrdersParams> {
  final UserOrdersRepository _repository;

  GetUserOrders(this._repository);
  @override
  Future<Either<Failure, Stream<List<Order>>>> call(
      {required GetUserOrdersParams params}) {
    return _repository.getOrders(params);
  }
}
