import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:users_logic/core/failures/auth/phone_credential_failure.dart';
import 'package:users_logic/core/params/auth/phone_sign_up_params.dart';
import 'package:users_logic/users_logic.dart';

import '../verifiy_phone/verifiy_phone_cubit.dart';

@injectable
class PhoneSignUpVerificationCubit extends VerifiyPhoneCubit {
  PhoneSignUpVerificationCubit(this._phoneSignUp, SmsAutoFill autoFill)
      : super(autoFill);
  final PhoneSignUp _phoneSignUp;

  Future<void> signUp(
      String name, String phoneNumber, String verificationId) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: state.otp.value);

    final either = await _phoneSignUp(
      params: PhoneSignUpParams(
        name: name,
        phoneNumber: phoneNumber,
        phoneCredential: credential,
      ),
    );
    either.fold((failure) {
      if (failure is PhoneCredentialFailure) {
        emit(state.copyWith(
            errorMessage: failure.message,
            status: FormzStatus.submissionFailure));
      }
    }, (success) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    });
  }
}
