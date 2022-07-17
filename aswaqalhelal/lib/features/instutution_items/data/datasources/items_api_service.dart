import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/firebase_auth.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/add_item/params.dart';
import '../../domain/entities/institution_item.dart';
import '../models/institution_item_model.dart';
import '../models/reference_item_model.dart';
import '../models/unit_model.dart';

abstract class ItemsApiService {
  Future<List<ReferenceItemModel>> searchItem(String val);

  Future<InstitutionItemModel> addInstitutionItem(
      AddInstitutionItemParams params);

  Future<InstitutionItemModel> addRefAndInstitutionItem(
      AddRefAndInstitutionItemParams params);

  Future<List<InstitutionItem>> getInstitutionItems(
      GetInstitutionItemsParams params);
}

@LazySingleton(as: ItemsApiService)
class ItemsApiServiceImpl implements ItemsApiService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ItemsApiServiceImpl(this._auth, this._firestore);
  @override
  Future<List<ReferenceItemModel>> searchItem(String val) async {
    final collection = _firestore.collection(FirestorePath.itemsReference);

    final snapshot = await collection
        .where('name', isGreaterThanOrEqualTo: val)
        .where('name', isLessThanOrEqualTo: val + "~")
        .orderBy('name')
        .get();
    final items = snapshot.docs.map(ReferenceItemModel.fromFirestore).toList();
    return items;
  }

  @override
  Future<InstitutionItemModel> addInstitutionItem(
      AddInstitutionItemParams params) async {
    final collection = _firestore.collection(FirestorePath.items);
    collection.where('institutionId' ,isEqualTo: params.itemName);

    final units = params.units
        .map((e) => {
              'name': e.name,
              'quantity': e.quantity,
              'price': e.price,
            })
        .toList();
    final ref = await collection.add({
      'name': params.itemName,
      'institutionId': params.institutionId,
      'referenceId': params.referenceId,
      'creationTime': FieldValue.serverTimestamp(),
      'units': units
    });
    return InstitutionItemModel(
      id: ref.id,
      institutionId: params.institutionId,
      name: params.itemName,
      creationTime: DateTime.now(),
      referenceId: params.referenceId,
      unitModels: units.map((e) => UnitModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<InstitutionItemModel> addRefAndInstitutionItem(
      AddRefAndInstitutionItemParams params) async {
    final batch = _firestore.batch();
    final refDoc = _firestore.collection(FirestorePath.itemsReference).doc();
    final doc = _firestore.collection(FirestorePath.items).doc();
    final units = params.units
        .map((e) => {
              'name': e.name,
              'quantity': e.quantity,
              'price': e.price,
            })
        .toList();
    batch.set(
      refDoc,
      {
        'name': params.itemName,
        'institutionId': params.institutionId,
        'creationTime': FieldValue.serverTimestamp(),
        'units': units
      },
    );

    batch.set(doc, {
      'name': params.itemName,
      'institutionId': params.institutionId,
      'referenceId': refDoc.id,
      'creationTime': FieldValue.serverTimestamp(),
      'units': units
    });

    await batch.commit();

    return InstitutionItemModel(
      id: doc.id,
      institutionId: params.institutionId,
      name: params.itemName,
      referenceId: refDoc.id,
      creationTime: DateTime.now(),
      unitModels: units.map((e) => UnitModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<List<InstitutionItem>> getInstitutionItems(
      GetInstitutionItemsParams params) async {
    final collection = _firestore
        .collection(FirestorePath.items)
        .where('institutionId', isEqualTo: params.institutionId);
    final querySnapshot = await collection.get();
    final institutionItems =
        querySnapshot.docs.map(InstitutionItemModel.fromFirestore).toList();
    return institutionItems;
  }
}

class FirestorePath {
  FirestorePath._();

  static String get itemsReference => 'items_reference';
  static String get items => 'items';
}
