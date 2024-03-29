import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/failures/auth/phone_credential_failure.dart';
import '../../../../../core/failures/server_failure.dart';
import '../../../../../core/form_inputs/phone_number.dart';
import '../../../../../core/params/auth/verify_phone_params.dart';
import '../../../../auth/domain/usecases/verify_phone_number.dart';

part 'update_phone_state.dart';

@injectable
class UpdatePhoneCubit extends Cubit<UpdatePhoneState> {
  final VerifyPhoneNumber _verifyPhoneNumber;
  UpdatePhoneCubit(
    this._verifyPhoneNumber,
  ) : super(const UpdatePhoneState());

  void phoneChanged(String phoneNumber) {
    final newPhone = PhoneNumber.dirty(phoneNumber);
    emit(state.copyWith(
        phoneNumber: newPhone, status: Formz.validate([newPhone])));
  }

  Future<void> verifiy() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final either = await _verifyPhoneNumber(
      params: VerifyPhoneParams(
        phoneNumber: state.phoneNumber.value,
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
