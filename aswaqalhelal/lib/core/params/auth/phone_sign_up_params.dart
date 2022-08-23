import 'package:firebase_auth/firebase_auth.dart';

class PhoneSignUpParams {
  PhoneSignUpParams(
      {required this.name, required this.phoneNumber, required this.phoneCredential});
  final String name;
  final String phoneNumber;
  final AuthCredential phoneCredential;
}
