import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:localstorage/localstorage.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../core/constants/local_storage_key.dart';

@module
abstract class RegisterModule {
  @injectable
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @injectable
  FacebookAuth get facebookAuth => FacebookAuth.instance;

  @injectable
  SmsAutoFill get smsAutoFill => SmsAutoFill();
  @injectable
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @preResolve
  Future<LocalStorage> get localStorage async {
    await FileHelper.createAppFolder();
    final localStorage = LocalStorage(LocalStorageKey.app);
    await localStorage.ready;
    return localStorage;
  }

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @injectable
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
  @injectable
  FirebaseAuth get auth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @injectable
  FirebaseFunctions get cloudFunctions => FirebaseFunctions.instance;

  @injectable
  FirebaseRemoteConfig get remoteConfig => FirebaseRemoteConfig.instance;

  @injectable
  Location get location => Location();
}
