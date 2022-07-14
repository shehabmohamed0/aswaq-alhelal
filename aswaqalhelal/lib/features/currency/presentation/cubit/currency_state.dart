part of 'currency_cubit.dart';

class CurrencyState extends Equatable {
  const CurrencyState({
    this.from = const CurrencyCode.pure('USD'),
    this.to = const CurrencyCode.pure('EGP'),
    this.amount = const CurrencyAmount.pure(),
    this.status = FormzStatus.pure,
    this.currency,
    this.errorMessage,
  });

  final CurrencyCode from;
  final CurrencyCode to;
  final CurrencyAmount amount;
  final FormzStatus status;
  final Currency? currency;
  final String? errorMessage;
  @override
  List<Object?> get props {
    return [
      from,
      to,
      amount,
      status,
      errorMessage,
    ];
  }

  CurrencyState copyWith({
    CurrencyCode? from,
    CurrencyCode? to,
    CurrencyAmount? amount,
    FormzStatus? status,
    Currency? currency,
    String? errorMessage,
  }) {
    return CurrencyState(
      from: from ?? this.from,
      to: to ?? this.to,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      currency: currency ?? this.currency,
    );
  }
}
