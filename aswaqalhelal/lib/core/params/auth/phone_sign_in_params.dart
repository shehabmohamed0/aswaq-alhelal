import 'package:firebase_auth/firebase_auth.dart';

class PhoneSignInParams {
  final PhoneAuthCredential phoneAuthCredential;
  PhoneSignInParams(this.phoneAuthCredential);
}
