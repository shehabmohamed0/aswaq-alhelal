// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:geo_logic/features/domain/usecases/add_address.dart' as _i6;
import 'package:geo_logic/features/domain/usecases/get_country.dart' as _i8;
import 'package:geo_logic/features/domain/usecases/get_current_location.dart'
    as _i9;
import 'package:geo_logic/features/domain/usecases/remove_address.dart' as _i10;
import 'package:geo_logic/features/domain/usecases/update_address.dart' as _i7;
import 'package:geo_logic/features/domain/usecases/usecases.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/presentation/bloc/select_location_map/select_location_map_bloc.dart'
    as _i11;
import '../features/presentation/cubit/addresses/addresses_cubit.dart' as _i3;
import '../features/presentation/cubit/user_address/user_address_cubit.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AddressesCubit>(() => _i3.AddressesCubit(
      get<_i4.GetAddresses>(),
      get<_i4.AddAddress>(),
      get<_i4.UpdateAddress>()));

  gh.factory<_i11.SelectLocationMapBloc>(
      () => _i11.SelectLocationMapBloc(get<_i9.GetCurrentLocation>()));
  gh.factory<_i12.UserAddressCubit>(() => _i12.UserAddressCubit(
      get<_i6.AddAddress>(),
      get<_i7.UpdateAddress>(),
      get<_i8.GetCountry>(),
      get<_i9.GetCurrentLocation>(),
      get<_i10.RemoveAddress>()));
  return get;
}
