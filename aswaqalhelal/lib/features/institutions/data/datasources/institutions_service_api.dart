import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/firebase_auth.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/add_institution_params.dart';
import '../../../../core/params/update_institution_params.dart';
import '../models/institution_model.dart';

abstract class InstitutionsServiceApi {
  Future<List<InstitutionModel>> getInstitutions();

  Future<InstitutionModel> addInstitution(AddInstitutionParams params);

  Future<InstitutionModel> updateInstitution(UpdateInstitutionParams params);
}

@LazySingleton(as: InstitutionsServiceApi)
class InstitutionsServiceApiImpl extends InstitutionsServiceApi {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  InstitutionsServiceApiImpl(this._auth, this._firestore);
  @override
  Future<List<InstitutionModel>> getInstitutions() async {
    final uid = _auth.currentUser!.uid;
    final collection = _firestore
        .collection(FirestorePath.institutions())
        .where('userId', isEqualTo: uid);
    final querySnapshot = await collection.get();
    final institutions =
        querySnapshot.docs.map(InstitutionModel.fromFirestore).toList();
    return institutions;
  }

  @override
  Future<InstitutionModel> addInstitution(AddInstitutionParams params) async {
    final uid = _auth.currentUser!.uid;
    final collection = _firestore.collection(FirestorePath.institutions());
    final newDoc = await collection.add({
      'userId': uid,
      'officialName': params.institution.officialName,
      'commercialName': params.institution.commercialName,
      'brandName': params.institution.brandName,
      'nickname': params.institution.nickname,
      'emails': params.institution.emails,
      'phoneNumbers': params.institution.phoneNumbers,
      'creationTime': FieldValue.serverTimestamp()
    });
    final institutionModel = InstitutionModel(
        id: newDoc.id,
        userId: params.institution.userId,
        officialName: params.institution.officialName,
        commercialName: params.institution.commercialName,
        brandName: params.institution.brandName,
        nickname: params.institution.nickname,
        emails: params.institution.emails,
        phoneNumbers: params.institution.phoneNumbers);
    return institutionModel;
  }

  @override
  updateInstitution(UpdateInstitutionParams params) async {
    final doc =
        _firestore.doc(FirestorePath.institution(params.institution.id));
    await doc.update({
      'officialName': params.institution.officialName,
      'commercialName': params.institution.commercialName,
      'brandName': params.institution.brandName,
      'nickname': params.institution.nickname,
      'emails': params.institution.emails,
      'phoneNumbers': params.institution.phoneNumbers,
    });
    final institutionModel = InstitutionModel(
        id: params.institution.id,
        userId: params.institution.userId,
        officialName: params.institution.officialName,
        commercialName: params.institution.commercialName,
        brandName: params.institution.brandName,
        nickname: params.institution.nickname,
        emails: params.institution.emails,
        phoneNumbers: params.institution.phoneNumbers);
    return institutionModel;
  }
}

class FirestorePath {
  static String institutions() => 'institutions';
  static String institution(String institutionId) =>
      'institutions/$institutionId';
}
