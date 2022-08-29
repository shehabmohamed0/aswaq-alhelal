import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../entities/receipt.dart';
import '../repositories/institution_receipts_repository.dart';

@LazySingleton()
class AddInstitutionReceipt
    extends UseCase<Receipt, AddInstitutionReceiptParams> {
  final InstitutionReceiptsRepository _repository;

  AddInstitutionReceipt(this._repository);
  @override
  Future<Either<Failure, Receipt>> call(
      {required AddInstitutionReceiptParams params}) {
    return _repository.addInstitutionReceipts(params);
  }
}
