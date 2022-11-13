import 'package:aswaqalhelal/core/firebase/firebase_path.dart';
import 'package:aswaqalhelal/features/orders/domain/entities/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../../../../core/params/institution_receipts/get_institution_receipts_params.dart';
import '../../../orders/data/models/order_model.dart';

abstract class InstitutionReceiptsApiService {
  Future<List<OrderModel>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params);
  Future<OrderModel> addInstitutionReceipt(AddInstitutionReceiptParams params);
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
    final counterDoc =
        _firestore.doc('institution_orders_counter/${params.from}');
    return _firestore.runTransaction<OrderModel>(
      (transaction) async {
        final counterSnapshot = await transaction.get(counterDoc);
        late int counter;
        if (counterSnapshot.exists) {
          counter = (counterSnapshot.get('counter') as num).toInt();
        } else {
          counter = 0;
          transaction.set(
            counterDoc,
            {
              'institutionId': params.from,
              'counter': counter,
            },
          );
        }
        final model = params.toModel(doc.id, counter);
        final data = model.toJson();
        data['creationTime'] = FieldValue.serverTimestamp();
        transaction.set(doc, data);
        transaction.update(counterDoc, {'counter': counter + 1});
        return model;
      },
    );
  }

  @override
  Future<List<OrderModel>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params) {
    throw UnimplementedError();
  }
}
