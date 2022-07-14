import 'package:root_package/packages/dartz.dart';

import '../../../../core/network/failure.dart';
import '../entities/currency.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, Currency>> convert(ConvertCurrencyParams params);
}

class ConvertCurrencyParams {
  final double amount;
  final String from;
  final String to;

  ConvertCurrencyParams(this.amount, this.from, this.to);
}
