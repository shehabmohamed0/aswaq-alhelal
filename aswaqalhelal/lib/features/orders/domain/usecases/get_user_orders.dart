import 'package:dartz/dartz.dart' hide Order;
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

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
