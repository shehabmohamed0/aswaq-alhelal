import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../l10n/l10n.dart';
import 'locator.config.dart';

final locator = GetIt.I;
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies(GetIt locator) async {
  locator.registerLazySingleton(() => AppLocalizations());
  await $initGetIt(locator);
}
