import 'package:formz/formz.dart';

import '../../l10n/l10n.dart';
import '../../locator/locator.dart';

/// Validation errors for the [MinimumLengthString] [FormzInput].
enum MinimumLengthStringValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template minimum length string}
/// Form input for an required string input.
/// {@endtemplate}
class MinimumLengthString
    extends FormzInput<String, MinimumLengthStringValidationError> {
  /// {@macro required string}
  const MinimumLengthString.pure(this.minimumLength) : super.pure('');

  const MinimumLengthString._(String val, this.minimumLength)
      : super.dirty(val);

  /// {@macro required string}
  MinimumLengthString dirty(String val) =>
      MinimumLengthString._(val, minimumLength);

  final int minimumLength;
  @override
  MinimumLengthStringValidationError? validator(String? value) {
    value ??= '';
    return value.trim().length < minimumLength
        ? MinimumLengthStringValidationError.invalid
        : null;
  }
}

extension MinimumLengthStringValidationMessage on MinimumLengthString {
  String? get validationMessage {
    final intl = locator<RootPackageLocalizations>();

    if (invalid) {
      if (error == MinimumLengthStringValidationError.invalid) {
        return intl.mustBeAtLeastNumberCharacter(minimumLength);
      }
    }
    return null;
  }
}
