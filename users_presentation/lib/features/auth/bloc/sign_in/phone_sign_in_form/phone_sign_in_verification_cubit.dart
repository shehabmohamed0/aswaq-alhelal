import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:root_package/root_package.dart';
import 'package:users_logic/core/failures/auth/phone_credential_failure.dart';
import 'package:users_logic/core/failures/auth/sign_in_with_credential_failure.dart';
import 'package:users_logic/core/params/auth/phone_sign_in_params.dart';
import 'package:users_logic/users_logic.dart';

import '../../verifiy_phone/verifiy_phone_cubit.dart';

@injectable
class PhoneSignInVerificationCubit extends VerifiyPhoneCubit {
  PhoneSignInVerificationCubit(
    this._signInWithPhone,
    SmsAutoFill autoFill,
  ) : super(autoFill);
  final SignInWithPhone _signInWithPhone;

  Future<void> signInWithPhoneNumber(String verificationId) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final PhoneAuthCredential phoneCredential = PhoneAuthProvider.credential(
        smsCode: state.otp.value, verificationId: verificationId);
    final either =
        await _signInWithPhone(params: PhoneSignInParams(phoneCredential));

    either.fold((failure) {
      if (failure is PhoneCredentialFailure) {
        emit(
          state.copyWith(
            errorMessage: failure.message,
            status: FormzStatus.submissionFailure,
          ),
        );
      } else if (failure is ServerFailure) {
        emit(
          state.copyWith(
            errorMessage: failure.message,
            status: FormzStatus.submissionFailure,
          ),
        );
      }
    }, (success) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    });
  }
}
