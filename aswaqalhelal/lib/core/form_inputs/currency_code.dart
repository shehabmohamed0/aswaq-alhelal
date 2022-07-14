import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/formz.dart';

import '../../l10n/l10n.dart';

enum CurrencyCodeValidatorError { invalid }

class CurrencyCode extends FormzInput<String, CurrencyCodeValidatorError> {
  /// {@macro currency code}
  const CurrencyCode.pure([String s = '']) : super.pure(s);

  /// {@macro currency code}
  const CurrencyCode.dirty([String value = '']) : super.dirty(value);

  @override
  CurrencyCodeValidatorError? validator(String? value) {
    value ??= '';
    return value.isNotEmpty ? null : CurrencyCodeValidatorError.invalid;
  }
}

extension CurrencyCodeValidationMessage on CurrencyCode {

  String? validationMessage() {
      final intl = locator<AppLocalizations>();

    if (invalid) {
      if (error == CurrencyCodeValidatorError.invalid) {
        return intl.invalidCode;
      }
    }
    return null;
  }
}
