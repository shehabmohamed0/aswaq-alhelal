import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:root_package/core/locale/locale_cubit.dart';
import 'package:root_package/core/resources/theme_manager.dart';
import 'package:root_package/l10n/l10n.dart';
import 'package:root_package/locator/locator.dart';

import 'bloc_observer.dart';
import 'features/auth/presentation/bloc/app_status/app_bloc.dart';
import 'features/start_up/presentation/cubit/cubit/start_up_cubit.dart';
import 'l10n/l10n.dart';
import 'locator/locator.dart';
import 'router.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      await RootPackageLocator.configureDependencies();
      configureDependencies(locator);
      // UsersPresentation.configureDependencies(locator);
      // GeoPresentation.configureDependencies(locator);
      runApp(const App());
    },
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

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
            // UsersLogicLocalizations.delegate,
            // UsersPresentationLocalizations.delegate,
            // GeoLogicLocalizations.delegate,
            // GeoPresentationLocalizations.delegate,
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
