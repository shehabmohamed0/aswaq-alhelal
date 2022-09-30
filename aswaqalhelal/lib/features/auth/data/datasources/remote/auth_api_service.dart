import 'dart:developer';

import '../../../../../core/firebase/firebase_path.dart';
import '../../../../../core/utils/logs.dart';
import '../../models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/packages/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/entities/base_profile.dart';
import '../../models/user/user_profile_model.dart';

abstract class AuthApiService {
  Future<void> signInWithPhoneCredential(
      String phoneNumber, PhoneAuthCredential phoneAuthCredential);

  Future<void> linkEmailAndPassword(String email, String password);
  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  });
  Stream<UserModel> get user;

  Future<void> signOut();
}

@LazySingleton(as: AuthApiService)
class AuthApiServiceImpl implements AuthApiService {
  FirebaseAuth firebaseAuth;
  GoogleSignIn googleSignIn;
  FacebookAuth facebookAuth;
  FirebaseFirestore firestore;
  FirebaseFunctions cloudFunctions;
  FirebaseMessaging firebaseMessaging;
  SharedPreferences sharedPreferences;
  AuthApiServiceImpl({
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.facebookAuth,
    required this.firestore,
    required this.cloudFunctions,
    required this.firebaseMessaging,
    required this.sharedPreferences,
  });

  @override
  Stream<UserModel> get user {
    return firebaseAuth.userChanges().switchMap((user) async* {
      if (user != null) {
        final snapshots =
            firestore.doc(FirestorePath.user(user.uid)).snapshots();
        yield* snapshots.map((e) {
          log(e.data().toString());
          return UserModel.fromFirestore(e);
        });
      } else {
        yield UserModel.empty;
      }
    });
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      firebaseAuth.signOut(),
      // googleSignIn.signOut(),
      // facebookAuth.logOut()
    ]);
  }

  @override
  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(PhoneAuthCredential phoneAuthCredential)
        verificationCompleted,
    required void Function(FirebaseAuthException verificationFailed)
        verificationFailed,
    required void Function(String p1, int? p2) codeSent,
    required void Function(String p1) codeAutoRetrievalTimeout,
  }) async {
    return await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Future<void> linkEmailAndPassword(String email, String password) async {
    final credential =
        EmailAuthProvider.credential(email: email, password: password);
    final user = firebaseAuth.currentUser!;
    await user.linkWithCredential(credential);
    final userProfileDoc = firestore.doc(FirestorePath.profile(user.uid));
    await userProfileDoc.update({'email': email});
  }

  @override
  Future<void> signInWithPhoneCredential(
      String phoneNumber, PhoneAuthCredential phoneAuthCredential) async {
    final userCredential =
        await firebaseAuth.signInWithCredential(phoneAuthCredential);
    final token = (await firebaseMessaging.getToken())!;
    final userDoc = firestore.doc(FirestorePath.user(userCredential.user!.uid));
    final profileDoc =
        firestore.doc(FirestorePath.profile(userCredential.user!.uid));
    final userTokens = userDoc.collection('tokens');
    if (userCredential.additionalUserInfo!.isNewUser) {
      final data = {
        'id': profileDoc.id,
        'userId': profileDoc.id,
        'name': '',
        'phoneNumber': phoneNumber,
        'type': ProfileType.user.toString(),
        'address': null
      };
      printLog('Create new user');
      await Future.wait([
        userDoc.set({
          'profiles': {userDoc.id: data}
        }),
        profileDoc.set(data),
        userTokens.doc(token).set({'token': token}),
        sharedPreferences.setString('device_fcm_token', token)
      ]);
    } else {
      final localToken = sharedPreferences.getString('device_fcm_token');
      if (localToken == null) {
        await Future.wait([
          sharedPreferences.setString('device_fcm_token', token),
          userTokens.doc(token).set({'token': token})
        ]);
      } else {
        if (localToken == token) return;
        await Future.wait([
          sharedPreferences.setString('device_fcm_token', token),
          userTokens.doc(token).set({'token': token}),
          userTokens.doc(localToken).delete()
        ]);
      }
    }
  }
}
