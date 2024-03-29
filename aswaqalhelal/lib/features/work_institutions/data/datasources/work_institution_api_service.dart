import 'package:aswaqalhelal/features/auth/data/models/user/institution_profile_model.dart';
import 'package:aswaqalhelal/features/work_institutions/domain/work_institution_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class WorkIstitutionsApiService {
  Future<List<InstitutionProfileModel>> getWorkInstitutions(
      GetWorkInstitutionsParams params);
}

@LazySingleton(as: WorkIstitutionsApiService)
class WorkIstitutionsApiServiceImpl extends WorkIstitutionsApiService {
  final FirebaseFirestore _firestore;

  WorkIstitutionsApiServiceImpl(this._firestore);
  @override
  Future<List<InstitutionProfileModel>> getWorkInstitutions(
      GetWorkInstitutionsParams params) async {
    final collection = _firestore.collection('employees');
    final snapshpt =
        await collection.where('userId', isEqualTo: params.userId).get();

    final futures = snapshpt.docs.map((employee) {
      final institutionId = employee.get('institutionId');
      final institutionDoc = _firestore.doc('profiles/$institutionId');

      return institutionDoc.get();
    });

    final docs = await Future.wait(futures);

    return docs.map(InstitutionProfileModel.fromFirestore).toList();
  }
}
