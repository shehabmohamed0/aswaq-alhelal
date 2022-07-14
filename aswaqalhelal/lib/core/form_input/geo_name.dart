import 'package:root_package/packages/formz.dart';

/// Validation errors for the [GeoName] [FormzInput].
enum GeoNameValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template geo geo GeoName  }
/// Form input for an geo GeoName  input.
/// {@endtemplate}
class GeoName extends FormzInput<String, GeoNameValidationError> {
  /// {@macro geo GeoName }
  const GeoName.pure() : super.pure('');

  /// {@macro geo GeoName }
  const GeoName.dirty([String value = '']) : super.dirty(value);

  @override
  GeoNameValidationError? validator(String? value) {
    value ??= '';
    return value.isNotEmpty ? null : GeoNameValidationError.invalid;
  }
}

extension GeoNameValidationMessage on GeoName {
  String? validationMessage() {
    if (invalid) {
      return 'Required';
    }
    return null;
  }
}
