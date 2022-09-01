import 'package:aswaqalhelal/features/institution_receipts/domain/entities/receipt.dart';
import 'package:root_package/packages/cloud_firestore.dart';
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
  final FirebaseFirestore _firestore;

  InstitutionReceiptsApiServiceImpl(this._firestore);
  @override
  Future<ReceiptModel> addInstitutionReceipt(
      AddInstitutionReceiptParams params) async {
    final collection = _firestore.collection('receipts');
    final doc = collection.doc();

    final model = params.toModel(doc.id);
    final data = model.toJson();
    data['creationTime'] = FieldValue.serverTimestamp();

    await doc.set(data);
    return model;
  }

  @override
  Future<List<ReceiptModel>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params) {
    throw UnimplementedError();
  }
}
