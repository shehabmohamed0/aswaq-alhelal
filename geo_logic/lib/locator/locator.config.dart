// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/network_info.dart' as _i9;
import 'package:root_package/packages/cloud_firestore.dart' as _i6;
import 'package:root_package/packages/firebase_auth.dart' as _i5;

import '../features/data/datasources/address_local_data_source.dart' as _i3;
import '../features/data/datasources/addresses_service_api.dart' as _i4;
import '../features/data/repositories/addresses_repository_impl.dart' as _i8;
import '../features/domain/repositories/addresses_repository.dart' as _i7;
import '../features/domain/usecases/add_address.dart' as _i15;
import '../features/domain/usecases/get_addresses.dart' as _i10;
import '../features/domain/usecases/get_country.dart' as _i11;
import '../features/domain/usecases/get_current_location.dart' as _i12;
import '../features/domain/usecases/remove_address.dart' as _i13;
import '../features/domain/usecases/update_address.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AddressesLocalDataSource>(
      () => _i3.AddressesLocalDataSourceImpl());
  gh.lazySingleton<_i4.AddressesServiceApi>(() => _i4.AddressesServiceApiImpl(
      get<_i5.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i7.AddressesRepository>(() => _i8.AddressesRepositoryImpl(
      get<_i4.AddressesServiceApi>(),
      get<_i9.NetworkInfo>(),
      get<_i3.AddressesLocalDataSource>()));
  gh.lazySingleton<_i10.GetAddresses>(
      () => _i10.GetAddresses(get<_i7.AddressesRepository>()));
  gh.lazySingleton<_i11.GetCountry>(
      () => _i11.GetCountry(get<_i7.AddressesRepository>()));
  gh.lazySingleton<_i12.GetCurrentLocation>(
      () => _i12.GetCurrentLocation(get<_i7.AddressesRepository>()));
  gh.lazySingleton<_i13.RemoveAddress>(
      () => _i13.RemoveAddress(get<_i7.AddressesRepository>()));
  gh.lazySingleton<_i14.UpdateAddress>(
      () => _i14.UpdateAddress(get<_i7.AddressesRepository>()));
  gh.lazySingleton<_i15.AddAddress>(
      () => _i15.AddAddress(get<_i7.AddressesRepository>()));
  return get;
}
