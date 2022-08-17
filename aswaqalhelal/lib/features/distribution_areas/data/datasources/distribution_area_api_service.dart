import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../domain/repositories/distribution_area_repository.dart';
import '../models/distribution_area_model.dart';

abstract class DistributionAreaApiService {
  Future<List<DistributionAreaModel>> getDistriputionAreas(
      GetDistributionAreasParams params);

  Future<DistributionAreaModel> addDistriputionArea(
      AddDistributionAreaParams params);

  Future<String> deleteDistriputionArea(DeleteDistributionAreaParams params);

  Future<DistributionAreaModel> updateDistriputionArea(
      UpdateDistributionAreaParams params);
}

@LazySingleton(as: DistributionAreaApiService)
class DistributionAreaApiServiceImpl extends DistributionAreaApiService {
  final FirebaseFirestore _firestore;

  DistributionAreaApiServiceImpl(this._firestore);
  @override
  Future<List<DistributionAreaModel>> getDistriputionAreas(
      GetDistributionAreasParams params) async {
    final doc = _firestore.doc('institutions/${params.institutionId}');
    final snapshot = await doc.get();
    final distriputionAreas =
        snapshot.data()!['distributionAreas'] as Map<String, dynamic>?;
    if (distriputionAreas == null) return [];
    final models = distriputionAreas.entries
        .map(DistributionAreaModel.fromMapEntry)
        .toList();

    return models;
  }

  @override
  Future<DistributionAreaModel> addDistriputionArea(
      AddDistributionAreaParams params) async {
    final collection = _firestore.collection('institutions');
    final doc = collection.doc(params.institutionId);
    final newId = collection.doc().id;
    final model = params.toModel(newId);
    await doc.update({'distributionAreas.$newId': model.toJson()});
    return model;
  }

  @override
  Future<String> deleteDistriputionArea(
      DeleteDistributionAreaParams params) async {
    final collection = _firestore.collection('institutions');
    final doc = collection.doc(params.institutionId);

    await doc.update({
      'distributionAreas.${params.distributionArea.id}': FieldValue.delete()
    });
    return params.distributionArea.id;
  }

  @override
  Future<DistributionAreaModel> updateDistriputionArea(
      UpdateDistributionAreaParams params) async {
    final collection = _firestore.collection('institutions');
    final doc = collection.doc(params.institutionId);
    final model = params.toModel(params.distributionArea.id);
    await doc.update(
        {'distributionAreas.${params.distributionArea.id}': model.toJson()});

    return model;
  }
}
