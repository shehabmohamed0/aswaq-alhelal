import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/form_inputs/name.dart';
import 'package:root_package/core/form_inputs/phone_number.dart';
import 'package:root_package/locator/locator.dart';

import '../../../../../../core/failures/auth/phone_credential_failure.dart';
import '../../../../../../core/params/auth/phone_exists_params.dart';
import '../../../../../../core/params/auth/verify_phone_params.dart';
import '../../../../../../l10n/l10n.dart';
import '../../../../domain/usecases/is_phone_exists_usecase.dart';
import '../../../../domain/usecases/verify_phone_number.dart';


part 'sign_up_form_state.dart';

@injectable
class SignUpFormCubit extends Cubit<SignUpFormState> {
  SignUpFormCubit(this._verifyPhoneNumber, this._isPhoneExistsUsecase)
      : super(const SignUpFormState());
  final VerifyPhoneNumber _verifyPhoneNumber;
  final IsPhoneExistsUsecase _isPhoneExistsUsecase;
  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        name: name,
        status: _validateWithNew(name: name),
      ),
    );
  }

  void init(TextEditingController controller, FocusNode focusNode,
      String? redirectedPhoneNumber) {
    if (redirectedPhoneNumber != null && !state.initialized) {
      controller.text = redirectedPhoneNumber;
      final text = controller.text;
      phoneChanged(text.startsWith('0')
          ? '+2$redirectedPhoneNumber'
          : '+20$redirectedPhoneNumber');

      focusNode.requestFocus();
      emit(state.copyWith(initialized: true));
    }
  }

  void phoneChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: _validateWithNew(phoneNumber: phoneNumber),
      ),
    );
  }

  FormzStatus _validateWithNew({
    Name? name,
    PhoneNumber? phoneNumber,
  }) {
    return Formz.validate(
        [name ?? state.name, phoneNumber ?? state.phoneNumber]);
  }

  Future<void> verifiy() async {
    log('verifiy triggered');

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final eitherExsistsOrNot = await _isPhoneExistsUsecase(
        params: PhoneExistsParams(state.phoneNumber.value));

    final canComplete = eitherExsistsOrNot.fold<bool>((failure) {
      if (failure is ServerFailure) {
        emit(state.copyWith(
          errorMessage: failure.message,
          status: FormzStatus.submissionFailure,
        ));
      }
      return false;
    }, (isExists) {
      if (isExists) {
        final intl = locator<AppLocalizations>();

        emit(state.copyWith(
          errorMessage: intl.phoneNumberAlreadyIsUse,
          status: FormzStatus.submissionFailure,
        ));
      }
      return !isExists;
    });

    if (!canComplete) return;

    final either = await _verifyPhoneNumber(
      params: VerifyPhoneParams(
        phoneNumber: state.phoneNumber.value,
        verificationCompleted: (_) {},
        codeAutoRetrievalTimeout: (_) {},
        codeSent: (verificationId, forceSent) {
          log('Code sent');
          emit(state.copyWith(
            verificationId: verificationId,
            status: FormzStatus.submissionSuccess,
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
