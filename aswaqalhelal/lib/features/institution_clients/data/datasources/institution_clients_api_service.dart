import 'package:aswaqalhelal/core/exceptions/institution_clients/client_exsists_before_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../../../auth/data/models/user/user_profile_model.dart';
import '../../domain/repositories/institution_clients_repository.dart';
import '../models/institution_client_model.dart';

abstract class InstitutionClientsApiService {
  Future<Iterable<InstitutionClientModel>> getInstitutionClients(
      AddInstitutionClientParams params);
  Future<UserProfileModel> getUserByPhoneNumber(
      GetUserByPhoneNumberParams params);
  Future<InstitutionClientModel> addInstitutionClient(
      AddInstitutionClientParams params);
}

@LazySingleton(as: InstitutionClientsApiService)
class InstitutionClientsApiServiceImpl extends InstitutionClientsApiService {
  InstitutionClientsApiServiceImpl(
    this._firestore,
    this._functions,
  );

  final FirebaseFirestore _firestore;
  final FirebaseFunctions _functions;

  @override
  Future<Iterable<InstitutionClientModel>> getInstitutionClients(
      AddInstitutionClientParams params) {
    return _firestore
        .collection(FirestorePath.institutionClients)
        .where('profile.name', isGreaterThanOrEqualTo: 'Cash')
        .where('profile.name', isLessThanOrEqualTo: "Cash\uf8ff")
        .get()
        .then<Iterable<InstitutionClientModel>>(
          (snapshot) => snapshot.docs.map(InstitutionClientModel.fromFirestore),
        );
  }

  @override
  Future<UserProfileModel> getUserByPhoneNumber(
      GetUserByPhoneNumberParams params) async {
    final data = await _functions
        .httpsCallable('getUserByPhoneNumber')
        .call<Map<String, dynamic>>(
      <String, dynamic>{
        'phoneNumber': params.phoneNumber,
      },
    );
    final json = data.data;
    json['address'] = (json['address'] as Map).cast<String, dynamic>();
    json['address']['geoPoint'] =
        (json['address']['geoPoint'] as Map).cast<String, dynamic>();
    return UserProfileModel.fromJson(data.data);
  }

  @override
  Future<InstitutionClientModel> addInstitutionClient(
      AddInstitutionClientParams params) async {
    final collection = _firestore.collection(FirestorePath.institutionClients);
    final doc = collection.doc();
    final model = params.toModel(doc.id);
    final clientExsits = await collection
        .where('profile.id', isEqualTo: model.profile.id)
        .limit(1)
        .get()
        .then((snapshot) => snapshot.docs.isNotEmpty);

    if (clientExsits) throw ClientExsitsBeforeException();

    final data = model.toJson();
    data['creationTime'] = FieldValue.serverTimestamp();
    await doc.set(data);
    return model;
  }
}
