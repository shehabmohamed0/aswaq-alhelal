import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput].
enum OTPValidationError {
  /// Generic invalid error.
  invalid
}

class OTP extends FormzInput<String, OTPValidationError> {
  const OTP.dirty(value) : super.dirty(value);
  const OTP.pure() : super.pure('');

  @override
  OTPValidationError? validator(String value) {
    if (value == '' || value.length < 6) {
      return OTPValidationError.invalid;
    }
    return null;
  }
}
