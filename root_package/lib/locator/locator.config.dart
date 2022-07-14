// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:cloud_functions/cloud_functions.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../core/locale/locale_cubit.dart' as _i9;
import '../core/services/cache_client.dart' as _i3;
import '../core/services/network_info.dart' as _i12;
import '../packages/firebase_remote_config.dart' as _i7;
import '../packages/location.dart' as _i11;
import '../packages/shared_preferences.dart' as _i10;
import 'register_module.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.CacheClient>(() => _i3.CacheClient());
  gh.factory<_i4.FirebaseAuth>(() => registerModule.auth);
  gh.factory<_i5.FirebaseFirestore>(() => registerModule.firestore);
  gh.factory<_i6.FirebaseFunctions>(() => registerModule.cloudFunctions);
  gh.factory<_i7.FirebaseRemoteConfig>(() => registerModule.remoteConfig);
  gh.factory<_i8.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.factory<_i9.LocaleCubit>(
      () => _i9.LocaleCubit(get<_i10.SharedPreferences>()));
  gh.factory<_i11.Location>(() => registerModule.location);
  gh.lazySingleton<_i12.NetworkInfo>(
      () => _i12.NetworkInfoImpl(get<_i8.InternetConnectionChecker>()));
  await gh.factoryAsync<_i13.SharedPreferences>(() => registerModule.prefs,
      preResolve: true);
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {}
