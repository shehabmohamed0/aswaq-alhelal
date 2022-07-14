import 'dart:developer';
import 'dart:io';

import 'package:aswaqalhelal/core/network/error_handler.dart';
import 'package:aswaqalhelal/core/network/failure.dart';
import 'package:aswaqalhelal/features/currency/data/datasources/remote_data_source.dart';
import 'package:aswaqalhelal/features/currency/domain/entities/currency.dart';
import 'package:aswaqalhelal/features/currency/domain/repositories/currency_repository.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/injectable.dart';

@LazySingleton(as: CurrencyRepository)
class CurrencyRepositoryImpl extends CurrencyRepository {
  CurrencyRepositoryImpl(this._remoteDataSource, this._networkInfo);
  final CurrencyApiService _remoteDataSource;
  final NetworkInfo _networkInfo;
  @override
  Future<Either<Failure, Currency>> convert(
      ConvertCurrencyParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
    try {
      final currency = await _remoteDataSource.convertCurrency(
          params.amount, params.from, params.to);
      if (currency.response.statusCode == HttpStatus.ok) {
        return Right(currency.data);
      } else {
        return Left(Failure(ApiInternalStatus.FAILURE,
            currency.response.statusMessage ?? ResponseMessage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
