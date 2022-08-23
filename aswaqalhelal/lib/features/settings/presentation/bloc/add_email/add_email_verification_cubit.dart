import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../../core/failures/auth/link_email_and_password_failure.dart';
import '../../../../../core/params/auth/link_email_and_password_params.dart';
import '../../../../auth/domain/usecases/link_email_and_password.dart';
import '../../../../auth/presentation/bloc/verifiy_phone/verifiy_phone_cubit.dart';


@injectable
class AddEmailVerificationCubit extends VerifiyPhoneCubit {
  AddEmailVerificationCubit(this._linkEmailAndPassword, SmsAutoFill autoFill)
      : super(autoFill);
  final LinkEmailAndPassword _linkEmailAndPassword;

  Future<void> linkEmailAndPassword(
      String email, String password, String verificationId) async {
    final credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: state.otp.value);

    await FirebaseAuth.instance.currentUser!
        .reauthenticateWithCredential(credential);
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final either = await _linkEmailAndPassword(
      params: LinkEmailAndPasswordParams(email: email, password: password),
    );
    either.fold((failure) {
      if (failure is LinkEmailAndPasswordFailure) {
        emit(state.copyWith(
            errorMessage: failure.message,
            status: FormzStatus.submissionFailure));
      } else if (failure is ServerFailure) {
        emit(state.copyWith(
            errorMessage: failure.message,
            status: FormzStatus.submissionFailure));
      }
    }, (success) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    });
  }
}
