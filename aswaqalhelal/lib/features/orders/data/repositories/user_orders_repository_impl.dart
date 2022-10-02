import 'package:dartz/dartz.dart' hide Order;
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/injectable.dart';

import '../../domain/entities/order.dart';
import '../../domain/repositories/user_orders_repository.dart';
import '../datasources/user_orders_api_service.dart';

@LazySingleton(as: UserOrdersRepository)
class UserOrdersRepositoryImpl extends UserOrdersRepository {
  final UserOrdersApiService _apiService;
  final NetworkInfo _networkInfo;

  UserOrdersRepositoryImpl(this._apiService, this._networkInfo);

  @override
  Future<Either<Failure, List<Order>>> getOrders(
      GetUserOrderParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final orders = await _apiService.getOrders(params);
      return Right(orders);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, Order>> placeOrder(PlaceOrderParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final orders = await _apiService.placeOrder(params);
      return Right(orders);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }
}