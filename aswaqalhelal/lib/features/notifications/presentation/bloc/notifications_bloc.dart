import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../core/request_state.dart';
import '../../domain/entities/fstore_notification_item.dart';
import '../../domain/repositories/notifications_repository.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class NotificationsBloc extends Bloc<NotificationEvent, NotificationsState> {
  final NotificationsRepository _repository;
  NotificationsBloc(this._repository)
      : super(NotificationsState(ids: HashSet())) {
    on<InitNotifications>(_onInitNotifications);
    on<GetNotifications>(_onGetNotifications,
        transformer: throttleDroppable(throttleDuration));
    on<GetBadgeCounter>(_onGetBadgeCounter);
    on<NotificationsOpened>(_onNotificationsOpened);
    on<NotificationReceived>(_onNotificationReceived);
    on<NotificationClicked>(_onNotificationClicked);
  }

  FutureOr<void> _onInitNotifications(
      InitNotifications event, Emitter<NotificationsState> emit) async {
    if (state.initStatus.isLoaded) return;
    emit(state.copyWith(initStatus: RequestState.loading));
    final either = await _repository.getNotifications(GetNotificationsParams());

    either.fold(
      (_) => emit(state.copyWith(initStatus: RequestState.error)),
      (notifications) {
        final newList = List.of(state.notifications);
        FStoreNotificationItem notification;
        for (int i = 0; i < notifications.length; i++) {
          notification = notifications[i];
          if (state.ids.contains(notification.id)) continue;
          state.ids.add(notification.id);
          newList.add(notification);
        }

        emit(state.copyWith(
          ids: state.ids,
          notifications: newList,
          initStatus: RequestState.loaded,
          hasReachedMax: notifications.length < 8,
        ));
      },
    );
  }

  FutureOr<void> _onGetNotifications(
      GetNotifications event, Emitter<NotificationsState> emit) async {
    if (state.loadingStatus.isLoading || state.hasReachedMax) return;
    emit(state.copyWith(loadingStatus: RequestState.loading));

    final either = await _repository.getNotifications(GetNotificationsParams(
        lastDocSnapshot: state.notifications.last.snapshot));

    either.fold(
      (_) => null,
      (notifications) {
        final newList = List.of(state.notifications);
        FStoreNotificationItem notification;

        for (int i = 0; i < notifications.length; i++) {
          notification = notifications[i];

          if (state.ids.contains(notification.id)) continue;
          state.ids.add(notification.id);
          newList.add(notification);
        }
        emit(state.copyWith(
          ids: state.ids,
          loadingStatus: RequestState.loaded,
          notifications: newList,
          hasReachedMax: notifications.length < 8,
        ));
      },
    );
  }

  FutureOr<void> _onGetBadgeCounter(
      GetBadgeCounter event, Emitter<NotificationsState> emit) async {
    final either = await _repository.getBadgeCounter();

    either.fold(
      (_) => null,
      (counter) => emit(state.copyWith(badgeCounter: counter)),
    );
  }

  FutureOr<void> _onNotificationsOpened(
      NotificationsOpened event, Emitter<NotificationsState> emit) async {
    if (state.badgeCounter == 0) return;
    emit(state.copyWith(badgeCounter: 0));
    final either = await _repository.resetBadgeCounter();
    either.fold((_) => null, (counter) => null);
  }

  FutureOr<void> _onNotificationReceived(
      NotificationReceived event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(
      ids: state.ids..add(event.notification.id),
      notifications: [event.notification, ...state.notifications],
      badgeCounter: state.badgeCounter + 1,
    ),);
  }

  FutureOr<void> _onNotificationClicked(
      NotificationClicked event, Emitter<NotificationsState> emit) async {
    if (event.notification.seen) return;
    final index = state.notifications
        .indexWhere((notification) => notification.id == event.notification.id);
    final notifications = List.of(state.notifications, growable: false);
    notifications[index] = event.notification.copyWith(seen: true);
    emit(state.copyWith(notifications: notifications));

    await _repository.seen(event.notification);
  }
}
