import 'package:formz/formz.dart';

import '../../l10n/l10n.dart';
import '../../locator/locator.dart';

/// Validation errors for the [Number] [FormzInput].
enum NumberValidationError {
  /// Generic invalid error.
  cantBeZero,
  cantBeDouble,
  cantBeNegative
}

/// {@template Number}
/// Form input for an Number input.
/// {@endtemplate}
class Number extends FormzInput<num, NumberValidationError> {
  /// {@macro Number}
  const Number.pure({
    this.acceptNegative = true,
    this.isFractional = true,
    this.acceptZero = true,
  }) : super.pure(0);

  const Number.price({
    this.acceptNegative = false,
    this.isFractional = true,
    this.acceptZero = false,
  }) : super.pure(0);

  const Number.quantity({
    this.acceptNegative = false,
    this.isFractional = false,
  })  : acceptZero = false,
        super.pure(0);

  // const Number._dirty(
  //     {required num number,
  //     required this.acceptNegative,
  //     required this.isFractional})
  //     : super.dirty(0);

  Number._(
      {required num number,
      required this.acceptNegative,
      required this.isFractional,
      required this.acceptZero})
      : super.dirty(number);

  final bool isFractional;
  final bool acceptNegative;
  final bool acceptZero;

  Number copyWith(num number) => Number._(
      number: number,
      acceptNegative: acceptNegative,
      isFractional: isFractional,
      acceptZero: acceptZero);

  @override
  NumberValidationError? validator(num value) {
    if (!isFractional) {
      if (value is int) return NumberValidationError.cantBeDouble;
    }
    if (!acceptNegative) {
      if (value < 0) return NumberValidationError.cantBeNegative;
    }

    if (!acceptZero) {
      if (value == 0) return NumberValidationError.cantBeZero;
    }

    return null;
  }
}

extension NumberValidationMessage on Number {
  String? validationMessage() {
    final intl = locator<RootPackageLocalizations>();

    if (invalid) {
      switch (error) {
        case NumberValidationError.cantBeZero:
          return intl.zeroIsAnInvalidNumber;
        case NumberValidationError.cantBeDouble:
          return intl.acceptsIntegersOnly;

        case NumberValidationError.cantBeNegative:
          return intl.theNumberCanNotBeNegative;
        default:
          return intl.invalidNumber;
      }
    }
    return null;
  }
}
