import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../models/order_model.dart';
import '../../domain/repositories/user_orders_repository.dart';

const orderQueryLimit = 10;

abstract class UserOrdersApiService {
  Future<Stream<List<OrderModel>>> getOrders(GetUserOrdersParams params);
  Future<OrderModel> placeOrder(PlaceOrderParams params);
}

@LazySingleton(as: UserOrdersApiService)
class UserOrdersApiServiceImpl extends UserOrdersApiService {
  final FirebaseFirestore _firestore;
  UserOrdersApiServiceImpl(this._firestore);

  @override
  Future<Stream<List<OrderModel>>> getOrders(GetUserOrdersParams params) async {
    final collection = _firestore.collection(FirestorePath.orders);
    var query = collection
        .where('to', isEqualTo: params.id)
        .orderBy('creationTime', descending: true);

    return query.snapshots().map((snapshot) {
      return snapshot.docs.map(OrderModel.fromFirestore).toList();
    });
  }

  @override
  Future<OrderModel> placeOrder(PlaceOrderParams params) async {
    final collection = _firestore.collection(FirestorePath.orders);
    final doc = collection.doc();
    final counterDoc =
        _firestore.doc(FirestorePath.institutionOrdersCounter(params.from));
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
}
