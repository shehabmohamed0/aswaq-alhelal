import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:root_package/packages/injectable.dart';

import '../../features/notifications/domain/entities/fstore_notification_item.dart';
import '../utils/logs.dart';
import 'notification_service.dart';
import '../utils/platform.dart';

@LazySingleton(as: NotificationService)
class FirebaseNotificationService extends NotificationService {
  final _instance = FirebaseMessaging.instance;

  StreamSubscription? _notificationSubscription;

  @override
  Future<bool> requestPermission() async {
    try {
      final result = await _instance.requestPermission();
      return result.alert == AppleNotificationSetting.enabled;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> init({
    String? externalUserId,
    required NotificationDelegate notificationDelegate,
  }) async {
    if (isInitialized) {
      return;
    }
    setIsInitialized();
    delegate = notificationDelegate;
    final startTime = DateTime.now();
    await _instance.getToken().then((token) async {
      printLog('[FirebaseCloudMessaging] init FCM token $token', startTime);
    });

    await _instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    final initMessage = await _instance.getInitialMessage();
    if (initMessage != null) {
      delegate.onMessageOpenedApp(FStoreNotificationItem(
        id: initMessage.data['id'] ?? '',
        title: initMessage.notification?.title ?? '',
        body: initMessage.notification?.body ?? '',
        data: initMessage.data,
        creationTime: DateTime.now(),
      ));
    }

    _notificationSubscription = FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        final notification = message.notification;
        final android = message.notification?.android;
        if (notification != null && android != null && isAndroid) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                // other properties...
              ),
              iOS: const IOSNotificationDetails(),
            ),
            // payload: 'Notification'
          );
        }

        delegate.onMessage(FStoreNotificationItem(
          id: message.data['id'] ?? '',
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
          data: message.data,
          creationTime: DateTime.now(),
        ));
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // printLog('Notification OpenedApp triggered');
      delegate.onMessageOpenedApp(FStoreNotificationItem(
        id: message.data['id'] ?? '',
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        data: message.data,
        creationTime: DateTime.now(),
      ));
    });
  }

  @override
  void disableNotification() {
    _instance.setForegroundNotificationPresentationOptions(
      alert: false, // Required to display a heads up notification
      badge: false,
      sound: false,
    );
    if (_notificationSubscription != null) {
      _notificationSubscription!.pause();
    }
  }

  @override
  void enableNotification() {
    _instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    if (_notificationSubscription != null) {
      _notificationSubscription!.resume();
    }
  }

  @override
  void setExternalId(String? userId) {}

  @override
  void removeExternalId() {}
}
