import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/packages/flutter_facebook_auth.dart';
import 'package:root_package/packages/google_sign_in.dart';
import 'package:sms_autofill/sms_autofill.dart';

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
}
