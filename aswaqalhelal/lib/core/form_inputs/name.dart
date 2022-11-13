import 'package:formz/formz.dart';
import 'package:aswaqalhelal/l10n/l10n.dart';

import 'package:aswaqalhelal/locator/locator.dart';

import '../../l10n/l10n.dart';
import '../../locator/locator.dart';

/// Validation errors for the [Name] [FormzInput].
enum NameValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template name}
/// Form input for an name input.
/// {@endtemplate}
class Name extends FormzInput<String, NameValidationError> {
  /// {@macro name}
  const Name.pure() : super.pure('');

  /// {@macro name}
  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    value ??= '';
    return value.trim().isNotEmpty ? null : NameValidationError.invalid;
  }
}

extension NameValidationMessage on Name {
  String? validationMessage() {
    final intl = locator<AppLocalizations>();

    if (invalid) {
      if (error == NameValidationError.invalid) {
        return intl.invalidName;
      }
    }
    return null;
  }
}
