import 'package:aswaqalhelal/features/currency/domain/entities/currency.dart';
import 'package:aswaqalhelal/features/currency/domain/repositories/currency_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/network/failure.dart';
@lazySingleton
class ConvertCurrencyUseCase extends UseCase<Currency, ConvertCurrencyParams> {
  ConvertCurrencyUseCase(this.currencyRepository);
  final CurrencyRepository currencyRepository;

  @override
  Future<Either<Failure, Currency>> call(
      {required ConvertCurrencyParams params}) {
    return currencyRepository.convert(params);
  }
}

abstract class UseCase<R, P> {
  Future<Either<Failure, R>> call({required P params});
}
