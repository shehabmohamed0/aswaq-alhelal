import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/formz.dart';

import '../../l10n/l10n.dart';

enum CurrencyAmountValidatorError { invalid }

class CurrencyAmount extends FormzInput<double, CurrencyAmountValidatorError> {
  /// {@macro currency Amount}
  const CurrencyAmount.pure() : super.pure(0);

  /// {@macro currency Amount}
  const CurrencyAmount.dirty([double value = 0]) : super.dirty(value);

  @override
  CurrencyAmountValidatorError? validator(double? value) {
    return value != 0 ? null : CurrencyAmountValidatorError.invalid;
  }
}

extension CurrencyAmountValidationMessage on CurrencyAmount {
  String? validationMessage() {
    final intl = locator<AppLocalizations>();
    if (invalid) {
      if (error == CurrencyAmountValidatorError.invalid) {
        return intl.invalidAmount;
      }
    }
    return null;
  }
}
