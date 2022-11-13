import 'package:formz/formz.dart';

import 'name.dart';

/// {@template optional name}
/// Form input for an name input.
/// {@endtemplate}
class OptionalName extends FormzInput<String, NameValidationError> {
  /// {@macro optional name}
  const OptionalName.pure() : super.pure('');

  /// {@macro optional name}
  const OptionalName.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    value ??= '';
    return null;
  }
}
