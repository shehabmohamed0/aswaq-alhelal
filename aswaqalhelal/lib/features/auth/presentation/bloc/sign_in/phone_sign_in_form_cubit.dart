import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/packages/firebase_auth.dart';
import 'package:root_package/root_package.dart';

import '../../../../../../core/failures/auth/phone_credential_failure.dart';
import '../../../../../../core/params/auth/phone_sign_in_params.dart';
import '../../../../../../core/params/auth/verify_phone_params.dart';
import '../../../domain/usecases/usecases.dart';

part 'phone_sign_in_form_state.dart';

@injectable
class PhoneSignInFormCubit extends Cubit<PhoneSignInFormState> {
  PhoneSignInFormCubit(
    this._verifyPhoneNumber,
    this._signInWithPhone,
  ) : super(const PhoneSignInFormState());
  final VerifyPhoneNumber _verifyPhoneNumber;
  final SignInWithPhone _signInWithPhone;
  void otpChanged(String value) {
    final newOTP = OTP.dirty(value);
    emit(state.copyWith(
      otp: newOTP,
      status: Formz.validate([newOTP]),
    ));
  }

  void phoneChanged(String value) {
    final phone = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phone,
        status: Formz.validate([phone]),
      ),
    );
  }

  void reset() {
    emit(const PhoneSignInFormState());
  }

  Future<void> verifiy() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    log('here');
    final either = await _verifyPhoneNumber(
      params: VerifyPhoneParams(
        phoneNumber: state.phoneNumber.value,
        verificationCompleted: (code) {
          emit(state.copyWith(
            otp: OTP.dirty(code.smsCode),
            verificationId: code.verificationId,
            verificationCompleted: true,
          ));
          log(code.token.toString());
        },
        codeAutoRetrievalTimeout: (timeOut) {
          log('time out');
        },
        codeSent: (verificationId, forceSent) {
          log('code sent');
          emit(state.copyWith(
            verificationId: verificationId,
            status: FormzStatus.valid,
            codeSent: true,
          ));
        },
        verificationFailed: (authException) {
          log(authException.code);
          final failure = PhoneCredentialFailure.fromCode(authException.code);
          emit(
            state.copyWith(
              errorMessage: failure.message,
              status: FormzStatus.submissionFailure,
            ),
          );
        },
      ),
    );
    either.fold((failure) {
      log('failure message');
      if (failure is ServerFailure) {
        emit(
          state.copyWith(
            errorMessage: failure.message,
            status: FormzStatus.submissionFailure,
          ),
        );
      }
    }, (_) {
      log('Success');
    });
  }

  Future<void> signInWithPhoneNumber() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final PhoneAuthCredential phoneCredential = PhoneAuthProvider.credential(
        smsCode: state.otp.value, verificationId: state.verificationId!);
    final either = await _signInWithPhone(
        params: PhoneSignInParams(
            phoneNumber: state.phoneNumber.value,
            phoneAuthCredential: phoneCredential));

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
     // emit(state.copyWith(status: FormzStatus.submissionSuccess));
    });
  }
}
