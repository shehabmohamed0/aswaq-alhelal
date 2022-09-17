part of 'notifications_bloc.dart';

abstract class NotificationEvent {}

class InitNotifications extends NotificationEvent {}

class GetNotifications extends NotificationEvent {}

class GetBadgeCounter extends NotificationEvent {}

class NotificationsOpened extends NotificationEvent {}

class NotificationClicked extends NotificationEvent {
 final FStoreNotificationItem notification;

  NotificationClicked(this.notification);

}

class NotificationReceived extends NotificationEvent {
  final FStoreNotificationItem notification;

  NotificationReceived(this.notification);
}
