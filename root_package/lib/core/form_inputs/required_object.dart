import 'package:formz/formz.dart';

import '../../l10n/l10n.dart';
import '../../locator/locator.dart';

/// Validation errors for the [RequiredObject] [FormzInput].
enum RequiredObjectValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template required object}
/// Form input for an required object input.
/// {@endtemplate}
class RequiredObject<T> extends FormzInput<T?, RequiredObjectValidationError> {
  /// {@macro required object}
  const RequiredObject.pure() : super.pure(null);

  /// {@macro required object}
  const RequiredObject.dirty(T? value) : super.dirty(value);
  bool get isNull => pure || invalid;
  bool get isNotNull => valid;
  @override
  RequiredObjectValidationError? validator(T? value) {
    return value == null ? RequiredObjectValidationError.invalid : null;
  }
}

extension RequiredObjectValidationMessage on RequiredObject {
  String? get validationMessage {
    final intl = locator<RootPackageLocalizations>();

    if (invalid) {
      print(error.runtimeType);
      if (error == RequiredObjectValidationError.invalid) {
        return intl.required;
      }
    }

    print('here');
    return null;
  }
}
