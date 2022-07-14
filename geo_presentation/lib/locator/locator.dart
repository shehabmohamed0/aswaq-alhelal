import 'package:geo_logic/locator/locator.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../l10n/l10n.dart';

import 'locator.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void _configureDependencies(GetIt locator) => $initGetIt(locator);

class GeoPresentation {
  GeoPresentation._();
  static void configureDependencies(GetIt locator) {
    GeoLogic.configureDependencies(locator);
    locator.registerLazySingleton(() => GeoPresentationLocalizations());
    return _configureDependencies(locator);
  }
}
/*
static Future<GeoPresentationLocalizations> load(Locale locale) {
    return MultipleLocalizations.load(
      initializeMessages,
      locale,
      (l) {
        final instance = GeoPresentationLocalizations();
        GeoPresentationLocalizations._current = instance;
        return instance;
      },
      setDefaultLocale: true,
    );
  }
 */