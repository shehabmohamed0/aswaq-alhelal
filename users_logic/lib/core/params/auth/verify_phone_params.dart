import 'package:firebase_auth/firebase_auth.dart';

class VerifyPhoneParams {
  final String phoneNumber;
  final void Function(PhoneAuthCredential p1) verificationCompleted;
  final void Function(FirebaseAuthException p1) verificationFailed;
  final void Function(String p1, int? p2) codeSent;
  final void Function(String p1) codeAutoRetrievalTimeout;
  VerifyPhoneParams(
      {required this.phoneNumber,
      required this.verificationCompleted,
      required this.verificationFailed,
      required this.codeSent,
      required this.codeAutoRetrievalTimeout});
}
