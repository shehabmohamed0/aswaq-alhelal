import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:root_package/core/locale/locale_cubit.dart';
import 'package:root_package/core/resources/theme_manager.dart';
import 'package:root_package/l10n/l10n.dart';
import 'package:root_package/locator/locator.dart';
import 'package:root_package/packages/firebase_core.dart';
import 'package:root_package/packages/flutter_bloc.dart';
import 'package:root_package/packages/flutter_easyloading.dart';

import 'bloc_observer.dart';
import 'features/auth/presentation/bloc/app_status/app_bloc.dart';
import 'features/start_up/presentation/cubit/start_up/start_up_cubit.dart';
import 'firebase_options.dart';
import 'l10n/l10n.dart';
import 'locator/locator.dart';
import 'router.dart';

/// call.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a background message ${message.messageId}');
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  log('message');
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,

          //      one that already exists in example app.
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  await RootPackageLocator.configureDependencies();
  configureDependencies(locator);
  runApp(const App());
}

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          lazy: false,
          create: (_) => locator(),
        ),
        BlocProvider<LocaleCubit>(
          lazy: false,
          create: (context) => locator()..init(),
        ),
        BlocProvider<StartUpCubit>(
          create: (context) => locator()..handleStartUp(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return MaterialApp(
          title: state.locale?.languageCode == 'ar'
              ? 'أسواق الهلال'
              : 'Aswaq Alhelal',
          theme: getApplicationTheme(),
          onGenerateRoute: AppRouter.generateRoute,
          builder: EasyLoading.init(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            RootPackageLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            if (supportedLocales
                .map((e) => e.languageCode)
                .contains(deviceLocale?.languageCode)) {
              return deviceLocale;
            } else {
              return const Locale('en', '');
            }
          },
          supportedLocales: RootPackageLocalizations.delegate.supportedLocales,
          locale: state.locale,
        );
      },
    );
  }
}
