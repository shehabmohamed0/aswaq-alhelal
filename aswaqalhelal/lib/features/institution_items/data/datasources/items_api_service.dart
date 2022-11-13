import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/extensions/prepare_for_search.dart';
import '../../../../core/firebase/firebase_path.dart';
import '../../../../core/params/add_item/params.dart';
import '../../../../core/utils/upload_file_method.dart';
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

  Future<InstitutionItemModel> updateInstitutionItem(
      UpdateInstitutionItemParams params);
}

@LazySingleton(as: ItemsApiService)
class ItemsApiServiceImpl implements ItemsApiService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ItemsApiServiceImpl(
    this._auth,
    this._firestore,
  );
  @override
  Future<List<ReferenceItemModel>> searchItem(String val) async {
    final collection = _firestore.collection(FirestorePath.itemsReference);
    final searchText = val.prepareForSearch();
    final snapshot = await collection
        .where('searchText', isGreaterThanOrEqualTo: searchText)
        // ignore: prefer_interpolation_to_compose_strings
        .where('searchText', isLessThanOrEqualTo: searchText + "\uf8ff")
        .orderBy('searchText')
        .get();
    final items = snapshot.docs.map(ReferenceItemModel.fromFirestore).toList();
    return items;
  }

  @override
  Future<InstitutionItemModel> addInstitutionItem(
      AddInstitutionItemParams params) async {
    final collection = _firestore.collection(FirestorePath.items);
    final ref = collection.doc();

    final units = params.units
        .map((e) => {
              'referenceId': e.referenceId,
              'name': e.name,
              'quantity': e.quantity,
              'price': e.price,
            })
        .toList();
    if (params.imageFile == null) {
      ref.set({
        'name': params.itemName,
        'searchText': params.itemName.prepareForSearch(),
        'institutionId': params.institutionId,
        'referenceId': params.referenceId,
        'creationTime': FieldValue.serverTimestamp(),
        'imageUrl': params.imageUrl,
        'units': units
      });
      return InstitutionItemModel(
        id: ref.id,
        institutionId: params.institutionId,
        name: params.itemName,
        imageUrl: params.imageUrl,
        creationTime: DateTime.now(),
        referenceId: params.referenceId,
        unitModels: units.map((e) => UnitModel.fromJson(e)).toList(),
      );
    }
    final either = await Utils.uploadFile(params.imageFile!, 'items/${ref.id}');
    return either.fold<Future<InstitutionItemModel>>(
      (exception) {
        throw exception;
      },
      (imageUrl) async {
        ref.set({
          'name': params.itemName,
          'searchText': params.itemName.prepareForSearch(),
          'institutionId': params.institutionId,
          'referenceId': params.referenceId,
          'creationTime': FieldValue.serverTimestamp(),
          'units': units
        });
        return InstitutionItemModel(
          id: ref.id,
          institutionId: params.institutionId,
          name: params.itemName,
          imageUrl: imageUrl,
          creationTime: DateTime.now(),
          referenceId: params.referenceId,
          unitModels: units.map((e) => UnitModel.fromJson(e)).toList(),
        );
      },
    );
  }

  @override
  Future<InstitutionItemModel> addRefAndInstitutionItem(
      AddRefAndInstitutionItemParams params) async {
    final refDoc = _firestore.collection(FirestorePath.itemsReference).doc();
    final doc = _firestore.collection(FirestorePath.items).doc();
    String? imageUrl;
    if (params.imageFile != null) {
      final eitherUrlOrFailure = await Utils.uploadFile(
        params.imageFile!,
        'items/${refDoc.id}/${basename(params.imageFile!.path)}',
      );
      imageUrl =
          eitherUrlOrFailure.fold((exception) => throw exception, (url) => url);
    }
    final model = params.toModel(doc.id, refDoc.id, imageUrl);
    final jsonData = model.toJson();
    jsonData['searchText'] = params.itemName.prepareForSearch();
    jsonData['creationTime'] = FieldValue.serverTimestamp();

    final batch = _firestore.batch();
    batch.set(refDoc, jsonData);
    batch.set(doc, jsonData);

    await batch.commit();

    return model;
  }

  @override
  Future<List<InstitutionItem>> getInstitutionItems(
      GetInstitutionItemsParams params) async {
    final collection = _firestore
        .collection(FirestorePath.items)
        .where('institutionId', isEqualTo: params.institutionId)
        .orderBy('creationTime', descending: true);
    final querySnapshot = await collection.get();
    final institutionItems =
        querySnapshot.docs.map(InstitutionItemModel.fromFirestore).toList();
    return institutionItems;
  }

  @override
  Future<InstitutionItemModel> updateInstitutionItem(
      UpdateInstitutionItemParams params) async {
    final itemRef = _firestore.doc(FirestorePath.item(params.oldItem.id));
    final units = params.units
        .map((e) => {
              'referenceId': e.referenceId,
              'name': e.name,
              'quantity': e.quantity,
              'price': e.price,
            })
        .toList();
    if (params.imageFile != null && params.imageUrl != null) {
      final either = await Utils.uploadFile(params.imageFile!,
          'items/${itemRef.id}/${basename(params.imageFile!.path)}');
      return either.fold<Future<InstitutionItemModel>>((exception) {
        throw exception;
      }, (imageUrl) async {
        await itemRef.update({
          'units': units,
          'imageUrl': imageUrl,
        });

        return InstitutionItemModel(
          id: params.oldItem.id,
          imageUrl: imageUrl,
          creationTime: params.oldItem.creationTime,
          institutionId: params.oldItem.referenceId,
          name: params.oldItem.name,
          referenceId: params.oldItem.referenceId,
          unitModels: units.map((e) => UnitModel.fromJson(e)).toList(),
        );
      });
    } else {
      await itemRef.update({
        'units': units,
      });

      return InstitutionItemModel(
        id: params.oldItem.id,
        imageUrl: params.oldItem.imageUrl,
        creationTime: params.oldItem.creationTime,
        institutionId: params.oldItem.referenceId,
        name: params.oldItem.name,
        referenceId: params.oldItem.referenceId,
        unitModels: units.map((e) => UnitModel.fromJson(e)).toList(),
      );
    }
  }
}
