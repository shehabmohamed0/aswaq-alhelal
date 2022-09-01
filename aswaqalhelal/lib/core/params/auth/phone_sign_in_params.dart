import 'package:firebase_auth/firebase_auth.dart';

class PhoneSignInParams {
  final String phoneNumber;
  final PhoneAuthCredential phoneAuthCredential;
  PhoneSignInParams({
    required this.phoneAuthCredential,
    required this.phoneNumber,
  });
}
