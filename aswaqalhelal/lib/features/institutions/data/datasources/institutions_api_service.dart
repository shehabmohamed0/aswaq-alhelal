import 'package:aswaqalhelal/features/instutution_items/data/models/institution_item_model.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../user_institutions/data/models/institution_model.dart';

abstract class InstitutionsApiService {
  Future<List<InstitutionModel>> getInstitutions();
}

@LazySingleton(as: InstitutionsApiService)
class InstitutionsApiServiceImpl extends InstitutionsApiService {
  final FirebaseFirestore _firestore;

  InstitutionsApiServiceImpl(this._firestore);
  @override
  Future<List<InstitutionModel>> getInstitutions() async {
    final collection = _firestore.collection('institutions');

    final institutions = await collection.get();

    final models = institutions.docs.map(InstitutionModel.fromFirestore).toList();

    return models;
  }
}
