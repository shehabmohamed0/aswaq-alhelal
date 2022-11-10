import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../../domain/entities/institution_client.dart';
import '../models/institution_client_model.dart';

abstract class InstitutionClientsApiService {
  Future<Iterable<InstitutionClient>> getClientsByName();
}

@LazySingleton(as: InstitutionClientsApiService)
class InstitutionClientsApiServiceImpl extends InstitutionClientsApiService {
  final FirebaseFirestore _firestore;

  InstitutionClientsApiServiceImpl(this._firestore);
  @override
  Future<Iterable<InstitutionClient>> getClientsByName() {
    return _firestore
        .collection(FirestorePath.institutionClients)
        .where('profile.name', isGreaterThanOrEqualTo: 'Cash')
        .where('profile.name', isLessThanOrEqualTo: "Cash\uf8ff")
        .get()
        .then<Iterable<InstitutionClient>>(
          (snapshot) => snapshot.docs.map(InstitutionClientModel.fromFirestore),
        );
  }
}
