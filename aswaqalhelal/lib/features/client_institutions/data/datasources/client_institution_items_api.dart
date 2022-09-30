import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../institution_items/data/models/institution_item_model.dart';

abstract class ClientInstitutionItemsApi {
  Future<List<InstitutionItemModel>> getItems(InstitutionProfile institution);
}

@LazySingleton(as: ClientInstitutionItemsApi)
class ClientInstitutionItemsApiImpl extends ClientInstitutionItemsApi {
  final FirebaseFirestore _firestore;

  ClientInstitutionItemsApiImpl(this._firestore);
  @override
  Future<List<InstitutionItemModel>> getItems(InstitutionProfile institution) async {
    final collection = _firestore
        .collection('items')
        .where('institutionId', isEqualTo: institution.id);
    final snap = await collection.get();

    return snap.docs.map(InstitutionItemModel.fromFirestore).toList();
  }
}
