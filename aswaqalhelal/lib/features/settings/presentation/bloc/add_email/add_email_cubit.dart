import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/failures/auth/phone_credential_failure.dart';
import '../../../../../core/failures/server_failure.dart';
import '../../../../../core/form_inputs/email.dart';
import '../../../../../core/form_inputs/password.dart';
import '../../../../../core/params/auth/verify_phone_params.dart';
import '../../../../auth/domain/usecases/verify_phone_number.dart';

part 'add_email_state.dart';

@injectable
class LinkEmailAndPasswordCubit extends Cubit<LinkEmailAndPasswordState> {
  LinkEmailAndPasswordCubit(this._verifyPhoneNumber)
      : super(const LinkEmailAndPasswordState());
  final VerifyPhoneNumber _verifyPhoneNumber;
  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> verifiy(String phoneNumber) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final either = await _verifyPhoneNumber(
      params: VerifyPhoneParams(
        phoneNumber: phoneNumber,
        verificationCompleted: (_) {},
        codeAutoRetrievalTimeout: (_) {},
        codeSent: (verificationId, forceSent) {
          emit(state.copyWith(
            verificationId: verificationId,
            status: FormzStatus.submissionSuccess,
          ));
        },
        verificationFailed: (authException) {
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
      if (failure is ServerFailure) {
        emit(
          state.copyWith(
            errorMessage: failure.message,
            status: FormzStatus.submissionFailure,
          ),
        );
      }
    }, (_) {});
  }
}
