import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:root_package/packages/firebase_remote_config.dart';
import 'package:root_package/packages/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
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
