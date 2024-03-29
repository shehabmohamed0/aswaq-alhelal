import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/locale/locale_cubit.dart';
import 'core/resources/theme_manager.dart';
import 'core/services/notification_service.dart';
import 'core/utils/logs.dart';
import 'features/auth/presentation/bloc/app_status/app_bloc.dart';
import 'features/notifications/domain/entities/fstore_notification_item.dart';
import 'features/notifications/presentation/bloc/notifications_bloc.dart';
import 'features/start_up/presentation/cubit/start_up/start_up_cubit.dart';
import 'l10n/l10n.dart';
import 'locator/locator.dart';
import 'router.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>
    with WidgetsBindingObserver
    implements NotificationDelegate {
  final _appBloc = locator<AppBloc>();
  final _localeCubit = locator<LocaleCubit>()..init();
  final _notificationCubit = locator<NotificationsBloc>()
    ..add(GetBadgeCounter());
  @override
  void initState() {
    printLog('[AppState] initState');
    WidgetsBinding.instance.addObserver(this);
    _appInitialModules();

    super.initState();
  }

  void _appInitialModules() {
    var startTime = DateTime.now();

    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        final notificationService = locator<NotificationService>();

        notificationService.init(notificationDelegate: this);
        notificationService.requestPermission();
        printLog('[AppState] Register Firebase', startTime);
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // _notificationModel.checkGranted();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _appBloc,
        ),
        BlocProvider.value(
          value: _localeCubit,
        ),
        BlocProvider.value(
          value: _notificationCubit,
        ),
        BlocProvider<StartUpCubit>(
          create: (context) => locator()..handleStartUp(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return MaterialApp(
            useInheritedMediaQuery: true,
            title: getAppTitle(state),
            theme: getApplicationTheme(),
            navigatorKey: App.navigatorKey,
            onGenerateRoute: AppRouter.generateRoute,
            builder: EasyLoading.init(
              builder: (context, child) => ResponsiveWrapper.builder(
                child,
                maxWidth: 1200,
                minWidth: 392,
                defaultScale: true,
                breakpoints: const [
                  ResponsiveBreakpoint.resize(392, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ],
                background: Container(
                  color: const Color(0xFFF5F5F5),
                ),
              ),
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
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
            supportedLocales: AppLocalizations.delegate.supportedLocales,
            locale: state.locale,
          );
        },
      ),
    );
  }

  String getAppTitle(LocaleState state) {
    return state.locale?.languageCode == 'ar'
        ? 'أسواق الهلال'
        : 'Aswaq Alhilal';
  }

  @override
  void onMessage(FStoreNotificationItem notification) {
    _notificationCubit.add(NotificationReceived(notification));
  }

  @override
  void onMessageOpenedApp(FStoreNotificationItem notification) {
    printLog(notification.toJson());
    _notificationCubit.add(NotificationReceived(notification));
  }
}
