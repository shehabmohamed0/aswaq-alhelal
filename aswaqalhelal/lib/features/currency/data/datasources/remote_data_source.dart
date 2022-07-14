import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:root_package/packages/injectable.dart';

import '../models/currency_model.dart';

part 'remote_data_source.g.dart';

@lazySingleton
@RestApi(baseUrl: 'https://api.apilayer.com/fixer')
abstract class CurrencyApiService {
  @factoryMethod
  factory CurrencyApiService(
    Dio dio,
  ) = _CurrencyApiService;
  @GET("/convert")
  Future<HttpResponse<CurrencyModel>> convertCurrency(
    @Query("amount") double amount,
    @Query("from") String from,
    @Query('to') String to,
  );
}
