import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

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
    final doc = collection.doc();
    final model = params.toModel(doc.id);

    final jsonData = model.toJson();
    jsonData['creationTime'] = FieldValue.serverTimestamp();

    await doc.set(jsonData);
    return model;
  }

  @override
  Future<List<UnitModel>> getUnitSuggestions(
      GetUnitSuggestionsParams params) async {
    final collection = _firestore.collection('units_reference');

    final snapshot = await collection
        .where('name', isGreaterThanOrEqualTo: params.searchText)
        .where('name', isLessThanOrEqualTo: params.searchText + "\uf8ff")
        .orderBy('name')
        .get();

    final items = snapshot.docs.map(UnitModel.fromFirestore).toList();
    return items;
  }
}
