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

class GeoLogic {
  GeoLogic._();
  static void configureDependencies(GetIt locator) {
    locator.registerLazySingleton(() => GeoLogicLocalizations());
    return _configureDependencies(locator);
  }
}
