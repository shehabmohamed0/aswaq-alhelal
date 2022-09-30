import 'package:aswaqalhelal/features/orders/data/models/order_model.dart';
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../../domain/repositories/institution_orders_repository.dart';

abstract class InstitutionOrdersApiService {
  Future<List<OrderModel>> getOrders(GetInstitutionOrdersParams params);
  Future<OrderModel> updateOrder(UpdateInstitutionOrderParams params);
}

@LazySingleton(as: InstitutionOrdersApiService)
class InstitutionOrdersApiServiceImpl extends InstitutionOrdersApiService {
  final FirebaseFirestore _firestore;
  InstitutionOrdersApiServiceImpl(this._firestore);

  @override
  Future<List<OrderModel>> getOrders(
      GetInstitutionOrdersParams params) async {
    final collection = _firestore.collection(FirestorePath.orders);
    var query = collection
        .where('to', isEqualTo: params.institutionId)
        .where('orderState',
            whereIn: params.whereIn
                .map((orderState) => orderState.toString())
                .toList())
        .orderBy('creationTime', descending: true);
    if (params.order != null) {
      query = query.startAfter([
        Timestamp.fromDate(params.order!.creationTime),
      ]);
    }
    query = query.limit(10);

    final snapshot = await query.get();
    return snapshot.docs.map(OrderModel.fromFirestore).toList();
  }

  @override
  Future<OrderModel> updateOrder(UpdateInstitutionOrderParams params) async {
    final doc = _firestore.doc(FirestorePath.order(params.order.id));
    await doc.update({'orderState': params.orderState});
    return OrderModel.fromDomain(params.order)
        .copyWith(orderState: params.orderState);
  }
}
