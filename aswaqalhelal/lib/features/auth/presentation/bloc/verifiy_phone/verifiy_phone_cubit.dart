import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:root_package/core/form_inputs/otp.dart';
import 'package:sms_autofill/sms_autofill.dart';

part 'verifiy_phone_state.dart';

abstract class VerifiyPhoneCubit extends Cubit<VerifiyPhoneState> {
  late final StreamSubscription<String> _codeSubscription;
  final SmsAutoFill _autoFill;
  VerifiyPhoneCubit(this._autoFill) : super(const VerifiyPhoneState()) {
    _autoFill.listenForCode().then((value) {
      _codeSubscription = _autoFill.code.listen((code) {
        final newOTP = OTP.dirty(code);
        emit(
          state.copyWith(
            autoRecievedCode: true,
            otp: newOTP,
            status: Formz.validate([newOTP]),
          ),
        );
      });
    });
  }

  void otpChanged(String value) {
    final newOTP = OTP.dirty(value);
    emit(state.copyWith(
      otp: newOTP,
      status: Formz.validate([newOTP]),
    ));
  }

  void onComplete() async {
    emit(state.copyWith(autoVerified: true));
  }

  @override
  Future<void> close() {
    _codeSubscription.cancel();
    return super.close();
  }
}