import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/core/form_inputs/email.dart';
import 'package:root_package/core/form_inputs/password.dart';
import 'package:users_logic/core/failures/auth/sign_in_with_email_and_password_exception.dart';
import 'package:users_logic/core/params/auth/sign_in_params.dart';
import 'package:users_logic/users_logic.dart';

part 'email_sign_in_form_state.dart';

@injectable
class EmailSignInFormCubit extends Cubit<EmailSignInFormState> {
  final SignInWithEmailAndPassword _signInWithEmailAndPassword;
  EmailSignInFormCubit(this._signInWithEmailAndPassword)
      : super(const EmailSignInFormState());
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

  Future<void> signInWithEmailAndPassword() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final either = await _signInWithEmailAndPassword(
        params: SignInParams(
            email: state.email.value, password: state.password.value));

    either.fold(
      (failure) {
        if (failure is SignInWithEmailAndPasswordFailure) {
          emit(
            state.copyWith(
              errorMessage: failure.message,
              status: FormzStatus.submissionFailure,
            ),
          );
        } else {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
      },
      (success) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      },
    );
  }

  void reset() {
    emit(const EmailSignInFormState());
  }
}
/*

  Future<void> signInWithEmailAndPassword() async {
    if (!state.status.isValidated) return;

    final either = await _signInWithEmailAndPassword(
        params: SignInParams(
            email: state.email.value, password: state.password.value));

    either.fold(
      (failure) {
        if (failure is SignInWithEmailAndPasswordFailure) {
          emit(
            state.copyWith(
              errorMessage: failure.message,
              status: FormzStatus.submissionFailure,
            ),
          );
        } else {
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
      },
      (success) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final either = await _signInWithGoogle(params: NoArgsParams());

    either.fold((failure) {
      if (failure is SignInWithCredentialFailure) {
        emit(
          state.copyWith(
              errorMessage: failure.message,
              status: FormzStatus.submissionFailure),
        );
      } else if (failure is GoogleSignInWithGoogleCanceledFailure) {
        emit(state.copyWith(
          status: Formz.validate([state.email, state.password]),
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }, (success) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    });
  }

  Future<void> signInWithFacebook() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final either = await _signInWithFacebook(params: NoArgsParams());

    either.fold((failure) {
      if (failure is SignInWithCredentialFailure) {
        emit(
          state.copyWith(
              errorMessage: failure.message,
              status: FormzStatus.submissionFailure),
        );
      } else if (failure is GoogleSignInWithGoogleCanceledFailure) {
        emit(state.copyWith(
          status: Formz.validate([state.email, state.password]),
        ));
      } else {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }, (success) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    });
  }

 */