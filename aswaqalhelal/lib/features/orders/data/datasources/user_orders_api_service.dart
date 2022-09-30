import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../models/order_model.dart';
import '../../domain/repositories/user_orders_repository.dart';

const orderQueryLimit = 10;

abstract class UserOrdersApiService {
  Future<List<OrderModel>> getOrders(GetUserOrderParams params);
  Future<OrderModel> placeOrder(PlaceOrderParams params);
}

@LazySingleton(as: UserOrdersApiService)
class UserOrdersApiServiceImpl extends UserOrdersApiService {
  final FirebaseFirestore _firestore;
  UserOrdersApiServiceImpl(this._firestore);

  @override
  Future<List<OrderModel>> getOrders(GetUserOrderParams params) async {
    final collection = _firestore.collection(FirestorePath.orders);
    var query = collection
        .where('to', isEqualTo: params.institutionId)
        .orderBy('creationTime', descending: true);
    if (params.order != null) {
      query =
          query.startAfter([Timestamp.fromDate(params.order!.creationTime)]);
    }
    query = query.limit(orderQueryLimit);

    final snapshot = await query.get();
    return snapshot.docs.map(OrderModel.fromFirestore).toList();
  }

  @override
  Future<OrderModel> placeOrder(PlaceOrderParams params) async {
    final collection = _firestore.collection(FirestorePath.orders);
    final doc = collection.doc();
    final model = params.toModel(doc.id);
    final json = model.toJson();
    json['creationTime'] = FieldValue.serverTimestamp();
    await doc.set(json);
    return model;
  }
}
