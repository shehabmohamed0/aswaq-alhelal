import 'package:aswaqalhelal/features/home/data/datasources/items_api_servic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../../../../core/params/add_institution_params/add_institution_params.dart';
import '../../../../core/params/update_institution_params.dart';
import '../../../auth/data/models/user/institution_profile_model.dart';

abstract class UserInstitutionsServiceApi {
  Future<List<InstitutionProfileModel>> getInstitutions();

  Future<InstitutionProfileModel> addInstitution(AddInstitutionParams params);

  Future<InstitutionProfileModel> updateInstitution(
      UpdateInstitutionParams params);
}

@LazySingleton(as: UserInstitutionsServiceApi)
class UserInstitutionsServiceApiImpl extends UserInstitutionsServiceApi {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  UserInstitutionsServiceApiImpl(this._auth, this._firestore);
  @override
  Future<List<InstitutionProfileModel>> getInstitutions() async {
    final uid = _auth.currentUser!.uid;
    final collection = _firestore
        .collection(FirestorePath.profiles)
        .where('userId', isEqualTo: uid)
        .where('type', isEqualTo: 'institution');
    final querySnapshot = await collection.get();
    final institutions =
        querySnapshot.docs.map(InstitutionProfileModel.fromFirestore).toList();
    return institutions;
  }

  @override
  Future<InstitutionProfileModel> addInstitution(
      AddInstitutionParams params) async {
    final uid = _auth.currentUser!.uid;
    final collection = _firestore.collection(FirestorePath.profiles);
    final newDoc = collection.doc();
    final newModel = params.toModel(newDoc.id, uid);
    final data = newModel.toJson();
    data['creationTime'] = FieldValue.serverTimestamp();
    await newDoc.set(data);
    return newModel;
  }

  @override
  updateInstitution(UpdateInstitutionParams params) async {
    final doc = _firestore.doc(FirestorePath.profile(params.institution.id));
    throw UnimplementedError();
    //   await doc.update({
    //     'officialName': params.institution.officialName,
    //     'commercialName': params.institution.commercialName,
    //     'brandName': params.institution.brandName,
    //     'nickname': params.institution.nickName,
    //     'emails': params.institution.emails,
    //     'phoneNumbers': params.institution.phoneNumbers,
    //   });
    //   final institutionProfileModel = InstitutionProfileModel(
    //       id: params.institution.id,
    //       userId: params.institution.userId,
    //       officialName: params.institution.officialName,
    //       commercialName: params.institution.commercialName,
    //       brandName: params.institution.brandName,
    //       nickName: params.institution.nickName,
    //       emails: params.institution.emails,
    //       phoneNumbers: params.institution.phoneNumbers);
    //   return institutionProfileModel;
    // }
  }
}
