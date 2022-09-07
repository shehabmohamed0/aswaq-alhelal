import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/packages/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/exceptions/google_sign_in_exceptions.dart';
import '../../../../../core/extensions/to_user.dart';
import '../../models/user/user_model.dart';

abstract class AuthApiService {
  Future<void> phoneSignUp(
      {required String name,
      required AuthCredential phoneCredential,
      required String phoneNumber});
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signInWithPhoneCredential(
      String phoneNumber, PhoneAuthCredential phoneAuthCredential);

  Future<void> signInWithGoogle();
  Future<void> linkEmailAndPassword(String email, String password);
  Future<void> signInWithFacebook();
  Future<bool> isPhoneNumberExists(String phoneNumber);
  Future<void> verifyPhone({
    required String phoneNumber,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  });
  Stream<UserModel> get user;

  UserModel get currentUser;

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
  Future<void> phoneSignUp({
    required String name,
    required AuthCredential phoneCredential,
    required String phoneNumber,
  }) async {
    final userCredential =
        await firebaseAuth.signInWithCredential(phoneCredential);
    final userDoc = firestore.doc(FirestorePath.user(userCredential.user!.uid));
    final token = await firebaseMessaging.getToken();
    await Future.wait([
      userDoc.set({'name': name, 'phoneNumber': phoneNumber}),
      userDoc.collection('tokens').doc(token).set({'token': token})
    ]);
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signInWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw GoogleSignInCanceledException();
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await firebaseAuth.signInWithCredential(credential);
  }

  @override
  Stream<UserModel> get user {
    return firebaseAuth.userChanges().switchMap((user) async* {
      if (user != null) {
        yield* firestore
            .doc(FirestorePath.user(user.uid))
            .snapshots()
            .map((doc) => UserModel.fromFireStore(doc));
      } else {
        yield UserModel.empty;
      }
    });
  }

  @override
  UserModel get currentUser {
    return firebaseAuth.currentUser.toUserModel();
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
  Future<void> signInWithFacebook() async {
    final LoginResult response = await facebookAuth.login();
    if (response.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = response.accessToken!;
      final credential = FacebookAuthProvider.credential(accessToken.token);
      await firebaseAuth.signInWithCredential(credential);
    }
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
    final userDoc = firestore.doc(FirestorePath.user(user.uid));
    await userDoc.update({'email': email});
  }

  @override
  Future<void> signInWithPhoneCredential(
      String phoneNumber, PhoneAuthCredential phoneAuthCredential) async {
    final userCredential =
        await firebaseAuth.signInWithCredential(phoneAuthCredential);
    final token = (await firebaseMessaging.getToken())!;
    final userDoc = firestore.doc(FirestorePath.user(userCredential.user!.uid));
    final userTokens = userDoc.collection('tokens');
    if (userCredential.additionalUserInfo!.isNewUser) {
      await Future.wait([
        userDoc.set({'phoneNumber': phoneNumber}),
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

  @override
  Future<bool> isPhoneNumberExists(String phoneNumber) async {
    final phoneExists = await cloudFunctions
        .httpsCallable('isPhoneExist')
        .call<bool>({'phoneNumber': phoneNumber});
    return phoneExists.data;
  }
}

class FirestorePath {
  static String user(String uid) => 'users/$uid';
  FirestorePath._();
}
