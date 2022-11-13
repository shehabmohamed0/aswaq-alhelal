import 'package:aswaqalhelal/l10n/l10n.dart';
import 'package:formz/formz.dart';

import '../../locator/locator.dart';
import '../mixin/contact_mixin.dart';

/// Validation errors for the [Email] [FormzInput].
enum EmailValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError>
    implements ContactInput {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
  );

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }

  @override
  String content() {
    return value;
  }
}

extension EmailValidationMessage on Email {
  String? get validationMessage {
    final intl = locator<AppLocalizations>();
    if (invalid) {
      if (error == EmailValidationError.invalid) {
        return intl.invalidEmailAddress;
      }
    }
    return null;
  }
}
