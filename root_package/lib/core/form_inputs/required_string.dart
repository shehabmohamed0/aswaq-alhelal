import 'package:formz/formz.dart';

import '../../l10n/l10n.dart';
import '../../locator/locator.dart';

/// Validation errors for the [RequiredString] [FormzInput].
enum RequiredStringValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template required string}
/// Form input for an required string input.
/// {@endtemplate}
class RequiredString extends FormzInput<String, RequiredStringValidationError> {
  /// {@macro required string}
  const RequiredString.pure() : super.pure('');

  /// {@macro required string}
  const RequiredString.dirty([String value = '']) : super.dirty(value);

  @override
  RequiredStringValidationError? validator(String? value) {
    value ??= '';
    return value.isNotEmpty ? null : RequiredStringValidationError.invalid;
  }
}

extension RequiredStringValidationMessage on RequiredString {
  String? get validationMessage {
    final intl = locator<RootPackageLocalizations>();

    if (invalid) {
      if (error == RequiredStringValidationError.invalid) {
        return intl.required;
      }
    }
    return null;
  }
}
