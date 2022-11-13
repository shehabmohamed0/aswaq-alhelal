import 'package:dartz/dartz.dart' hide Order;
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../../../orders/domain/entities/order.dart';
import '../repositories/institution_receipts_repository.dart';

@LazySingleton()
class AddInstitutionReceipt
    extends UseCase<Order, AddInstitutionReceiptParams> {
  final InstitutionReceiptsRepository _repository;

  AddInstitutionReceipt(this._repository);
  @override
  Future<Either<Failure, Order>> call(
      {required AddInstitutionReceiptParams params}) {
    return _repository.addInstitutionReceipts(params);
  }
}
