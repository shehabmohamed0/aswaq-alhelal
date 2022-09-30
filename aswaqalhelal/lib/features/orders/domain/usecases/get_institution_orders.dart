import 'package:dartz/dartz.dart' hide Order;
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../entities/order.dart';
import '../repositories/institution_orders_repository.dart';

@LazySingleton()
class GetInstitutionOrders
    extends UseCase<List<Order>, GetInstitutionOrdersParams> {
  final InstitutionOrdersRepository _repository;

  GetInstitutionOrders(this._repository);
  @override
  Future<Either<Failure, List<Order>>> call(
      {required GetInstitutionOrdersParams params}) {
    return _repository.getOrders(params);
  }
}
