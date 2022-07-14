import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sms_autofill/sms_autofill.dart';

@module
abstract class RegisterModule {
  @injectable
  GoogleSignIn get googleSignIn => GoogleSignIn();

  @injectable
  FacebookAuth get facebookAuth => FacebookAuth.instance;

  @injectable
  SmsAutoFill get smsAutoFill => SmsAutoFill();
}
