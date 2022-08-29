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
    final collection = _firestore.collection('distributionAreas');
    final distriputionAreas = await collection
        .where('institutionId', isEqualTo: params.institutionId)
        .get();
    final models = distriputionAreas.docs
        .map(DistributionAreaModel.fromFirestore)
        .toList();

    return models;
  }

  @override
  Future<DistributionAreaModel> addDistriputionArea(
      AddDistributionAreaParams params) async {
    final collection = _firestore.collection('distributionAreas');
    final doc = collection.doc();
    final model = params.toModel(doc.id);
    final jsonData = model.toJson();
    jsonData['institutionId'] = params.institutionId;
    await doc.set(jsonData);
    return model;
  }

  @override
  Future<String> deleteDistriputionArea(
      DeleteDistributionAreaParams params) async {
    final collection = _firestore.collection('distributionAreas');
    final doc = collection.doc(params.distributionArea.id);

    await doc.delete();
    return params.distributionArea.id;
  }

  @override
  Future<DistributionAreaModel> updateDistriputionArea(
      UpdateDistributionAreaParams params) async {
    final collection = _firestore.collection('distributionAreas');
    final doc = collection.doc(params.distributionArea.id);
    final model = params.toModel(params.distributionArea.id);
    await doc.update(model.toJson());

    return model;
  }
}
