import 'package:firebase_auth/firebase_auth.dart';

class UpdatePhoneNumberParams {
  final String phoneNumber;
  final PhoneAuthCredential phoneCredential;
  UpdatePhoneNumberParams({
    required this.phoneCredential,
    required this.phoneNumber,
  });
}
