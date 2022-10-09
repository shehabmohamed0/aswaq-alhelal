import 'package:dartz/dartz.dart' hide Order;
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../entities/order.dart';
import '../repositories/institution_orders_repository.dart';

@LazySingleton()
class UpdateInstitutionOrder
    extends UseCase<Order, UpdateInstitutionOrderParams> {
  final InstitutionOrdersRepository _repository;

  UpdateInstitutionOrder(this._repository);
  @override
  Future<Either<Failure, Order>> call(
      {required UpdateInstitutionOrderParams params}) {

    return _repository.updateOrders(params);
  }
}
