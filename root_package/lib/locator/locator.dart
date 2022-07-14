import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../l10n/l10n.dart';
import 'locator.config.dart';

GetIt locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> _configureDependencies() => $initGetIt(locator);

class RootPackageLocator {
  RootPackageLocator._();
  static Future<void> configureDependencies() {
    locator.registerLazySingleton(() => RootPackageLocalizations());
    return _configureDependencies();
  }
}
