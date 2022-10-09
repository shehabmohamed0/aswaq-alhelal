import 'dart:developer';

import 'package:aswaqalhelal/core/failures/orders/update_order_failure.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:root_package/core/exceptions/exceptions.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/exceptions/orders/accept_order_exception.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/institution_orders_repository.dart';
import '../datasources/institution_orders_api_service.dart';

@LazySingleton(as: InstitutionOrdersRepository)
class InstitutionOrdersRepositoryImpl extends InstitutionOrdersRepository {
  final InstitutionOrdersApiService _apiService;
  final NetworkInfo _networkInfo;

  InstitutionOrdersRepositoryImpl(this._apiService, this._networkInfo);
  @override
  Future<Either<Failure, List<Order>>> getOrders(
      GetInstitutionOrdersParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final orders = await _apiService.getOrders(params);
      return Right(orders);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, Order>> updateOrders(
      UpdateInstitutionOrderParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final orders = await _apiService.updateOrder(params);
      return Right(orders);
    } on AcceptOrderException catch (e) {
      return Left(UpdateOrderFailure(
          'This order has been canceled by the user', e.newOrder));
    } on Exception {
      return Left(ServerFailure.general());
    }
  }
}
