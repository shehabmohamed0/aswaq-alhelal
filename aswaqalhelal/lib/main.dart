import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/firebase_core.dart';
import 'package:root_package/packages/flutter_bloc.dart';

import 'app.dart';
import 'bloc_observer.dart';
import 'core/utils/logs.dart';
import 'firebase_options.dart';
import 'locator/locator.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  printLog('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await RootPackageLocator.configureDependencies();
  await configureDependencies(locator);
  // Wrap your app

  runApp(const App());
}
