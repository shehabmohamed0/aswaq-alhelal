import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/extensions/prepare_for_search.dart';
import '../../domain/repositories/units_repository.dart';
import '../models/unit_model.dart';

abstract class UnitsApiService {
  Future<UnitModel> addUnitToReference(AddUnitToReferenceParams params);
  Future<List<UnitModel>> getUnitSuggestions(GetUnitSuggestionsParams params);
}

@LazySingleton(as: UnitsApiService)
class UnitsApiServiceImpl extends UnitsApiService {
  final FirebaseFirestore _firestore;

  UnitsApiServiceImpl(this._firestore);
  @override
  Future<UnitModel> addUnitToReference(AddUnitToReferenceParams params) async {
    final collection = _firestore.collection('units_reference');

    final unitSnapshot = await collection
        .where('searchText', isEqualTo: params.name.prepareForSearch())
        .limit(1)
        .get();
    if (unitSnapshot.docs.isNotEmpty) {
      final unit = UnitModel.fromFirestore(unitSnapshot.docs.first);
      unit.copyWith(price: params.price, quantity: params.quantity);
      return unit;
    }
    final doc = collection.doc();
    final model = params.toModel(doc.id);

    final jsonData = model.toJson();
    jsonData['searchText'] = model.name.prepareForSearch();
    jsonData['creationTime'] = FieldValue.serverTimestamp();

    await doc.set(jsonData);
    return model;
  }

  @override
  Future<List<UnitModel>> getUnitSuggestions(
      GetUnitSuggestionsParams params) async {
    final collection = _firestore.collection('units_reference');
    final searchText = params.searchText.prepareForSearch();
    final snapshot = await collection
        .where('searchText', isGreaterThanOrEqualTo: searchText)
        .where('searchText', isLessThanOrEqualTo: searchText + "\uf8ff")
        .orderBy('searchText')
        .get();

    final items = snapshot.docs.map(UnitModel.fromFirestore).toList();
    return items;
  }
}
