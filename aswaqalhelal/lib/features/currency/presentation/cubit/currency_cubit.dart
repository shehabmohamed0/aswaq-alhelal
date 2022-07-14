import 'package:aswaqalhelal/core/converters/currency_coverter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/form_inputs/currency_amount.dart';
import '../../../../core/form_inputs/currency_code.dart';
import '../../domain/entities/currency.dart';
import '../../domain/repositories/currency_repository.dart';
import '../../domain/usecases/change_currency_usecase.dart';

part 'currency_state.dart';

@injectable
class CurrencyCubit extends Cubit<CurrencyState> {
  final ConvertCurrencyUseCase _convertCurrencyUseCase;
  CurrencyCubit(this._convertCurrencyUseCase) : super(const CurrencyState());

  void fromChanged(String? from) {
    if (from != null) {
      final newFrom = CurrencyCode.dirty(from);
      emit(state.copyWith(
        from: newFrom,
        status: Formz.validate([newFrom, state.to, state.amount]),
      ));
    }
  }

  void toChanged(String? to) {
    if (to != null) {
      final newTo = CurrencyCode.dirty(to);
      emit(state.copyWith(
        from: newTo,
        status: Formz.validate([state.from, newTo, state.amount]),
      ));
    }
  }

  void amountChanged(String amount) {
    final amountD = CurrencyCoverter.convert(amount);
    if (amountD != null) {
      final newAmount = CurrencyAmount.dirty(amountD);
      emit(state.copyWith(
        amount: newAmount,
        status: Formz.validate([state.from, state.to, state.amount]),
      ));
    } else {
      emit(state.copyWith(status: FormzStatus.invalid));
    }
  }

  void swap() {
    emit(
      state.copyWith(
        from: state.to,
        to: state.from,
        status: FormzStatus.submissionCanceled,
      ),
    );
  }

  Future<void> covertCurrency() async {
    if (state.status.isInvalid) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final either = await _convertCurrencyUseCase(
      params: ConvertCurrencyParams(
          state.amount.value, state.from.value, state.to.value),
    );

    either.fold((failure) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: failure.message,
        ),
      );
    }, (currency) {
      emit(
        state.copyWith(
          currency: currency,
          status: FormzStatus.submissionSuccess,
        ),
      );
    });
  }
}
