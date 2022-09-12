import 'package:aswaqalhelal/features/user_institutions/data/models/institution_model.dart';
import 'package:aswaqalhelal/features/work_institutions/domain/work_institution_repository.dart';
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

abstract class WorkIstitutionsApiService {
  Future<List<InstitutionModel>> getWorkInstitutions(
      GetWorkInstitutionsParams params);
}

@LazySingleton(as: WorkIstitutionsApiService)
class WorkIstitutionsApiServiceImpl extends WorkIstitutionsApiService {
  final FirebaseFirestore _firestore;

  WorkIstitutionsApiServiceImpl(this._firestore);
  @override
  Future<List<InstitutionModel>> getWorkInstitutions(
      GetWorkInstitutionsParams params) async {
    final collection = _firestore.collection('employees');
    final snapshpt =
        await collection.where('userId', isEqualTo: params.userId).get();

    final futures = snapshpt.docs.map((employee) {
      final institutionId = employee.get('institutionId');
      final institutionDoc = _firestore.doc('institutions/$institutionId');

      return institutionDoc.get();
    });

    final docs = await Future.wait(futures);

    return docs.map(InstitutionModel.fromFirestore).toList();
  }
}
