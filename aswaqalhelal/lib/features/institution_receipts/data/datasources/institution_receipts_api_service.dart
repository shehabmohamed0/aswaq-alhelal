import 'package:aswaqalhelal/core/firebase/firebase_path.dart';
import 'package:aswaqalhelal/features/orders/domain/entities/order.dart';
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../../../../core/params/institution_receipts/get_institution_receipts_params.dart';
import '../../../orders/data/models/order_model.dart';

abstract class InstitutionReceiptsApiService {
  Future<List<OrderModel>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params);
  Future<OrderModel> addInstitutionReceipt(
      AddInstitutionReceiptParams params);
}

@LazySingleton(as: InstitutionReceiptsApiService)
class InstitutionReceiptsApiServiceImpl extends InstitutionReceiptsApiService {
  final FirebaseFirestore _firestore;

  InstitutionReceiptsApiServiceImpl(this._firestore);
  @override
  Future<OrderModel> addInstitutionReceipt(
      AddInstitutionReceiptParams params) async {
    final collection = _firestore.collection(FirestorePath.orders);
    final doc = collection.doc();

    final model = params.toModel(doc.id);
    final data = model.toJson();
    data['creationTime'] = FieldValue.serverTimestamp();

    await doc.set(data);
    return model;
  }

  @override
  Future<List<OrderModel>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params) {
    throw UnimplementedError();
  }
}
