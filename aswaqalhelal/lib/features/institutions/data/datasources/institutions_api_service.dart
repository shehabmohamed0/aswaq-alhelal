import 'dart:collection';
import 'dart:developer';

import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../address/domain/entities/address.dart';
import '../../../distribution_areas/data/models/distribution_area_model.dart';
import '../../../user_institutions/data/models/institution_model.dart';

abstract class InstitutionsApiService {
  Future<List<InstitutionModel>> getInstitutions(Address address);
}

@LazySingleton(as: InstitutionsApiService)
class InstitutionsApiServiceImpl extends InstitutionsApiService {
  final FirebaseFirestore _firestore;

  InstitutionsApiServiceImpl(this._firestore);
  @override
  Future<List<InstitutionModel>> getInstitutions(Address address) async {
    final collection = _firestore.collection('distributionAreas');

    final HashSet<String> seen = HashSet();

    log(address.governateId);
    log(address.cityId);
    log(address.neighborhoodId);
    final results = await Future.wait([
      collection
          .where('parentId', isEqualTo: address.governateId)
          .where('city', isNull: true)
          .where('neighborhood', isNull: true)
          .get(),
      collection
          .where('parentId', isEqualTo: address.cityId)
          .where('neighborhood', isNull: true)
          .get(),
      collection.where('parentId', isEqualTo: address.neighborhoodId).get()
    ]);

    final instCollection = _firestore.collection('institutions');

    final institutionIds =
        results.fold<List<String>>([], (previousValue, element) {
      return previousValue
        ..addAll(
          element.docs
              .map(DistributionAreaModel.fromFirestore)
              .where((element) {
            final notSeen = !seen.contains(element.institutionId);
            if (notSeen) {
              seen.add(element.id);
            }
            return notSeen;
          }).map((e) => e.institutionId),
        );
    });
    final futures = institutionIds.map((e) => instCollection.doc(e).get());
    final docs = await Future.wait(futures);

    final models = docs.map(InstitutionModel.fromFirestore).toList();
    return models;
  }
}
