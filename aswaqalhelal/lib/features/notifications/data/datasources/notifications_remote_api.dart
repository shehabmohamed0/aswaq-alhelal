import 'dart:developer';

import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/firebase_auth.dart';
import 'package:root_package/packages/injectable.dart';

import '../../domain/entities/fstore_notification_item.dart';
import '../../domain/repositories/notifications_repository.dart';

abstract class NotificationsApiService {
  Future<List<FStoreNotificationItem>> getNotifications(
      GetNotificationsParams params);
  Future<int> getBadgeCounter();
  Future<int> resetBadgeCounter();

  Future<void> seen(FStoreNotificationItem notification);
}

@LazySingleton(as: NotificationsApiService)
class NotificationsApiServiceImpl extends NotificationsApiService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  NotificationsApiServiceImpl(this._firestore, this._auth);
  @override
  Future<List<FStoreNotificationItem>> getNotifications(
      GetNotificationsParams params) async {
    final userId = _auth.currentUser!.uid;
    final collection = _firestore.collection('notifications');
    var query = collection
        .where('userId', isEqualTo: userId)
        .orderBy('creationTime', descending: true);

    final documentSnapshot = params.lastDocSnapshot;
    if (documentSnapshot != null) {
      query = query.startAfterDocument(documentSnapshot);
    }
    query = query.limit(8);

    final snapshot = await query.get();
    final notifications = snapshot.docs
        .map((docSnapshot) =>
            FStoreNotificationItem.fromJson(docSnapshot.data(), docSnapshot))
        .toList();

    
    return notifications;
  }

  @override
  Future<int> getBadgeCounter() async {
    final userId = _auth.currentUser!.uid;
    final doc = _firestore.doc('notifications_counter/$userId');
    final snapshot = await doc.get();
    return (snapshot.data()!['counter'] as int?) ?? 0;
  }

  @override
  Future<int> resetBadgeCounter() async {
    final userId = _auth.currentUser!.uid;
    final doc = _firestore.doc('notifications_counter/$userId');
    await doc.update({'counter': 0});
    return 0;
  }

  @override
  Future<void> seen(FStoreNotificationItem notification) async {
    final doc = _firestore.doc('notifications/${notification.id}');
    await doc.update({'seen': true});
  }
}
