import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  late final StreamSubscription _onMessage;
  NotificationCubit() : super(NotificationInitial()) {
    _onMessage = FirebaseMessaging.onMessage.listen((message) {


      
    });
  }

  Future<void> initilize() async {





  }
}
