import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../../../auth/data/models/user/user_profile_model.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../domain/entities/institution_client.dart';
import '../../domain/repositories/institution_clients_repository.dart';
import '../models/institution_client_model.dart';

abstract class InstitutionClientsApiService {
  Future<Iterable<InstitutionClient>> getClientsByName(
      AddInstitutionClientParams params);
  Future<UserProfile> getUserByPhoneNumber(GetUserByPhoneNumberParams params);
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
  Future<Iterable<InstitutionClient>> getClientsByName(
      AddInstitutionClientParams params) {
    return _firestore
        .collection(FirestorePath.institutionClients)
        .where('profile.name', isGreaterThanOrEqualTo: 'Cash')
        .where('profile.name', isLessThanOrEqualTo: "Cash\uf8ff")
        .get()
        .then<Iterable<InstitutionClient>>(
          (snapshot) => snapshot.docs.map(InstitutionClientModel.fromFirestore),
        );
  }

  @override
  Future<UserProfile> getUserByPhoneNumber(
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
}
