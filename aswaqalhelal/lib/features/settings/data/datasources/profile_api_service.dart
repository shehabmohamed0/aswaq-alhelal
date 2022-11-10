import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/firebase_auth.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/firebase/firebase_path.dart';

abstract class ProfileApiService {
  Future<void> updateProfile(
      {String? name, DateTime? birthDate, String? gender});

  Future<void> updatePhoneNumber(
      String phoneNumber, PhoneAuthCredential phoneCredential);

  Future<void> linkEmailAndPassword(String email, String password);
  Future<void> updateEmail(
      String newEmail, String currentEmail, String currentPassword);
}

@LazySingleton(as: ProfileApiService)
class ProfileApiServiceImpl implements ProfileApiService {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  ProfileApiServiceImpl(this.firebaseAuth, this.firestore);

  @override
  Future<void> updateProfile(
      {String? name, DateTime? birthDate, String? gender}) {
    final userId = firebaseAuth.currentUser!.uid;
    final userDoc = firestore.doc(FirestorePath.profile(userId));
    return userDoc.update({
      'name': name,
      'birthDate': birthDate?.toIso8601String(),
      'gender': gender != null
          ? gender.isEmpty
              ? null
              : gender
          : null,
    });
  }

  @override
  Future<void> updatePhoneNumber(
      String phoneNumber, PhoneAuthCredential phoneCredential) async {
    final user = firebaseAuth.currentUser!;
    await user.updatePhoneNumber(phoneCredential);
    final userDoc = firestore.doc(FirestorePath.profile(user.uid));
    await userDoc.update({
      'phoneNumber': phoneNumber,
    });
  }

  @override
  Future<void> linkEmailAndPassword(String email, String password) async {
    final user = firebaseAuth.currentUser!;
    final credential =
        EmailAuthProvider.credential(email: email, password: password);
    user.linkWithCredential(credential);
    final userDoc = firestore.doc(FirestorePath.profile(user.uid));
    await userDoc.update({'email': email});
  }

  @override
  Future<void> updateEmail(
      String newEmail, String currentEmail, String currentPassword) async {
    final credential = EmailAuthProvider.credential(
        email: currentEmail, password: currentPassword);
    final authResult = await firebaseAuth.currentUser!
        .reauthenticateWithCredential(credential);

    final user = authResult.user!;
    await user.updateEmail(newEmail);
    final userDoc = firestore.doc(FirestorePath.profile(user.uid));
    await userDoc.update({'email': newEmail});
  }
}
