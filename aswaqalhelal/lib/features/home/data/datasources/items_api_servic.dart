
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../institution_items/data/models/institution_item_model.dart';

abstract class ItemsApiService2 {
  Future<List<InstitutionItemModel>> getItems();
}

@LazySingleton(as: ItemsApiService2)
class ItemsApiServiceImpl extends ItemsApiService2 {
  final FirebaseFirestore _firestore;

  ItemsApiServiceImpl(this._firestore);

  @override
  Future<List<InstitutionItemModel>> getItems() async {
    final collection = _firestore.collection(FirestorePath.items);
    final snapshot =
        await collection.orderBy('creationTime', descending: true).get();
    final items =
        snapshot.docs.map(InstitutionItemModel.fromFirestore).toList();
    return items;
  }
}

class FirestorePath {
  static const items = 'items';
}
