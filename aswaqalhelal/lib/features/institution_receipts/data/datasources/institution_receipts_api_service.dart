import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../../../../core/params/institution_receipts/get_institution_receipts_params.dart';
import '../models/receipt_model.dart';

abstract class InstitutionReceiptsApiService {
  Future<List<ReceiptModel>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params);
  Future<ReceiptModel> addInstitutionReceipt(
      AddInstitutionReceiptParams params);
}

@LazySingleton(as: InstitutionReceiptsApiService)
class InstitutionReceiptsApiServiceImpl extends InstitutionReceiptsApiService {
  @override
  Future<ReceiptModel> addInstitutionReceipt(
      AddInstitutionReceiptParams params) {
    throw UnimplementedError();
  }

  @override
  Future<List<ReceiptModel>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params) {
    throw UnimplementedError();
  }
}
