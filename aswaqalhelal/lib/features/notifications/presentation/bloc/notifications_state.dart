part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  const NotificationsState({
    this.notifications = const [],
    required this.ids,
    this.badgeCounter = 0,
    this.hasReachedMax = false,
    this.initStatus = RequestState.initial,
    this.loadingStatus = RequestState.initial,
  });
  final List<FStoreNotificationItem> notifications;
  final HashSet<String> ids;
  final int badgeCounter;
  final bool hasReachedMax;
  final RequestState initStatus;
  final RequestState loadingStatus;

  NotificationsState copyWith({
    List<FStoreNotificationItem>? notifications,
    HashSet<String>? ids,
    int? badgeCounter,
    bool? hasReachedMax,
    RequestState? initStatus,
    RequestState? loadingStatus,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      ids: ids ?? this.ids,
      badgeCounter: badgeCounter ?? this.badgeCounter,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      initStatus: initStatus ?? this.initStatus,
      loadingStatus: initStatus ?? this.initStatus,
    );
  }

  @override
  List<Object> get props =>
      [notifications, badgeCounter, hasReachedMax, initStatus, loadingStatus,ids];
}
