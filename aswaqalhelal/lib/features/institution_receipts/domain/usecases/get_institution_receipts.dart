import 'package:dartz/dartz.dart' hide Order;
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/institution_receipts/get_institution_receipts_params.dart';
import '../../../orders/domain/entities/order.dart';
import '../repositories/institution_receipts_repository.dart';

@LazySingleton()
class GetInstitutionReceipts
    extends UseCase<List<Order>, GetInstitutionReceiptsParams> {
  final InstitutionReceiptsRepository _repository;

  GetInstitutionReceipts(this._repository);
  @override
  Future<Either<Failure, List<Order>>> call(
      {required GetInstitutionReceiptsParams params}) {
    return _repository.getInstitutionReceipts(params);
  }
}
