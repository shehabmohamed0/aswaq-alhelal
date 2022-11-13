import 'dart:developer';

import 'package:formz/formz.dart';
import 'package:aswaqalhelal/l10n/l10n.dart';

import 'package:aswaqalhelal/locator/locator.dart';
import 'package:equatable/equatable.dart';

import '../../l10n/l10n.dart';
import '../../locator/locator.dart';

/// Validation errors for the [NullableNumber] [FormzInput].
enum NullableNumberValidationError {
  /// Generic invalid error.
  cantBeZero,
  invalid,
  cantBeNegative
}

/// {@template NullableNumber}
/// Form input for an NullableNumber input.
/// {@endtemplate}
class NullableNumber<T extends num>
    extends FormzInput<T?, NullableNumberValidationError> with EquatableMixin {
  /// {@macro NullableNumber}
  const NullableNumber.purePrice({
    this.acceptZero = true,
  })  : acceptNegative = false,
        priceText = '',
        super.pure(null);

  factory NullableNumber.dirtyPrice({
    bool acceptZero = true,
    required T? number,
  }) {
    return NullableNumber<T>._(
      number: number,
      priceText: number == null ? '' : number.toString(),
      acceptNegative: false,
      acceptZero: acceptZero,
    );
  }
  factory NullableNumber.dirtyStringPrice({
    bool acceptZero = true,
    required String priceText,
  }) {
    T? number;
    if (T is int) {
      number = int.tryParse(priceText) as T?;
    } else {
      try {
        number = double.tryParse(priceText) as T?;
      } on TypeError {
        number = null;
      }
    }
    return NullableNumber<T>._(
      number: number,
      priceText: priceText,
      acceptNegative: false,
      acceptZero: acceptZero,
    );
  }

  NullableNumber._({
    required T? number,
    required this.priceText,
    required this.acceptNegative,
    required this.acceptZero,
  }) : super.dirty(number);

  final String priceText;
  final bool acceptNegative;
  final bool acceptZero;

  String stringValue() {
    if (value == null) {
      return '';
    } else {
      return value.toString();
    }
  }

  @override
  NullableNumberValidationError? validator(T? value) {
    if (priceText.isNotEmpty) {
      if (value == null) {
        return NullableNumberValidationError.invalid;
      }
    }

    if (!acceptNegative) {
      if (value != null) {
        if (value < 0) return NullableNumberValidationError.cantBeNegative;
      }
    }
    if (!acceptZero) {
      if (value == 0) return NullableNumberValidationError.cantBeZero;
    }

    return null;
  }

  @override
  List<Object?> get props => [priceText, acceptNegative, acceptZero, value];
}

extension NullableNumberValidationMessage on NullableNumber {
  String? validationMessage() {
    final intl = locator<AppLocalizations>();

    if (invalid) {
      switch (error) {
        case NullableNumberValidationError.cantBeZero:
          return intl.invalidNumber;
        case NullableNumberValidationError.cantBeNegative:
          return intl.theNumberCanNotBeNegative;
        case NullableNumberValidationError.invalid:
          return intl.invalidNumber;
        default:
      }
    }
    return null;
  }
}
