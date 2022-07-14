import 'package:formz/formz.dart';

import '../../l10n/l10n.dart';
import '../../locator/locator.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class Password extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp = RegExp(
      r'^(?=^.{8,40}$)(?=.*\d)(?=.*[\W_])(?=.*[a-z])(?=.*[A-Z])(?!^.*\n).*$');

  @override
  PasswordValidationError? validator(String? value) {
    return (value?.length ?? 0) >= 8 ? null : PasswordValidationError.invalid;
  }
}

extension PasswordValidationMessage on Password {
  String? get validationMessage {
  final intl = locator<RootPackageLocalizations>();

    if (invalid) {
      if (error == PasswordValidationError.invalid) {
        return intl.invalidPassword;
      }
    }
    return null;
  }
}
