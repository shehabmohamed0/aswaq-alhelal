import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/dartz.dart';

import '../entities/fstore_notification_item.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<FStoreNotificationItem>>> getNotifications(GetNotificationsParams params);
  Future<Either<Failure, int>> getBadgeCounter();
  Future<Either<Failure, int>> resetBadgeCounter();
  Future<Either<Failure, void>> seen(FStoreNotificationItem notification);

}

class GetNotificationsParams {
  final DocumentSnapshot? lastDocSnapshot;

  GetNotificationsParams({
     this.lastDocSnapshot,
  });
}
