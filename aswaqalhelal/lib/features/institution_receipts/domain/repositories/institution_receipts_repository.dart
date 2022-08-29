import 'package:root_package/root_package.dart';

import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../../../../core/params/institution_receipts/get_institution_receipts_params.dart';
import '../entities/receipt.dart';

abstract class InstitutionReceiptsRepository {
  Future<Either<Failure, List<Receipt>>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params);
  Future<Either<Failure, Receipt>> addInstitutionReceipts(
      AddInstitutionReceiptParams params);
}
