
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/core/failures/firestore_failure.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:users_logic/core/failures/settings/update_phone_number_failure.dart';
import 'package:users_logic/core/params/settings/update_phone_params.dart';
import 'package:users_logic/features/settings/domain/usecases/update_phone_number.dart';

import '../../../auth/bloc/verifiy_phone/verifiy_phone_cubit.dart';


@injectable
class UpdatePhoneVerificationCubit extends VerifiyPhoneCubit {
  UpdatePhoneVerificationCubit(this._updatePhoneNumber, SmsAutoFill autoFill)
      : super(autoFill);
  final UpdatePhoneNumber _updatePhoneNumber;

  Future<void> updatePhone(String phoneNumber, String verificationId) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: state.otp.value);
    final either = await _updatePhoneNumber(
      params: UpdatePhoneNumberParams(
        phoneCredential: credential,
        phoneNumber: phoneNumber,
      ),
    );

    either.fold((failure) {
      if (failure is UpdatePhoneNumberFailure) {
        emit(
          state.copyWith(
              errorMessage: failure.message,
              status: FormzStatus.submissionFailure),
        );
      } else if (failure is FirestoreFailure) {
        emit(
          state.copyWith(
              errorMessage: 'failure', status: FormzStatus.submissionFailure),
        );
      }
    }, (success) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    });
  }
}
