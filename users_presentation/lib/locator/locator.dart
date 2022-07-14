import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:users_logic/locator/locator.dart';

import '../l10n/l10n.dart';
import 'locator.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void _configureDependencies(GetIt locator) => $initGetIt(locator);

class UsersPresentation {
  UsersPresentation._();
  static void configureDependencies(GetIt locator) {
    UsersLogic.configureDependencies(locator);
    locator.registerLazySingleton(() => UsersPresentationLocalizations());
    return _configureDependencies(locator);
  }
}
