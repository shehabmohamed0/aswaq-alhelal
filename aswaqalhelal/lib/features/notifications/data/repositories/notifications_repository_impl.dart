import 'dart:developer';

import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/services/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/fstore_notification_item.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_remote_api.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl extends NotificationsRepository {
  final NotificationsApiService _notificationsApiService;
  final NetworkInfo _networkInfo;
  NotificationsRepositoryImpl(this._notificationsApiService, this._networkInfo);

  @override
  Future<Either<Failure, List<FStoreNotificationItem>>> getNotifications(
      GetNotificationsParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final notifications =
          await _notificationsApiService.getNotifications(params);
      return Right(notifications);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, int>> getBadgeCounter() async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final counter = await _notificationsApiService.getBadgeCounter();
      return Right(counter);
    } catch (e) {
      (e.toString());

      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, int>> resetBadgeCounter() async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final counter = await _notificationsApiService.resetBadgeCounter();
      return Right(counter);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, void>> seen(
      FStoreNotificationItem notification) async {
    try {
      await _notificationsApiService.seen(notification);
      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }
}
