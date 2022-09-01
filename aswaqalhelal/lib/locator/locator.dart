import 'package:aswaqalhelal/features/auth/presentation/bloc/sign_in/phone_sign_in_form_cubit.dart';

import '../l10n/l10n.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies(GetIt locator) {
  locator.registerLazySingleton(() => AppLocalizations());
  $initGetIt(locator);

}
