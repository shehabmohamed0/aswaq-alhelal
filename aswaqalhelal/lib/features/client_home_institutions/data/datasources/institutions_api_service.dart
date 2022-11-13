import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../../../address/domain/entities/address.dart';
import '../../../auth/data/models/user/institution_profile_model.dart';
import '../../../distribution_areas/data/models/distribution_area_model.dart';

abstract class InstitutionsApiService {
  Future<List<InstitutionProfileModel>> getInstitutions(Address address);
}

@LazySingleton(as: InstitutionsApiService)
class InstitutionsApiServiceImpl extends InstitutionsApiService {
  final FirebaseFirestore _firestore;

  InstitutionsApiServiceImpl(this._firestore);
  @override
  Future<List<InstitutionProfileModel>> getInstitutions(Address address) async {
    final collection = _firestore.collection('distributionAreas');

    final HashSet<String> seen = HashSet();

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

    final instCollection = _firestore.collection('profiles');

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

    final models = docs.map((e) {
      return InstitutionProfileModel.fromFirestore(e);
    }).toList();
    return models;
  }
}
