// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/network_info.dart' as _i10;
import 'package:root_package/packages/cloud_firestore.dart' as _i6;
import 'package:root_package/packages/firebase_auth.dart' as _i5;
import 'package:root_package/root_package.dart' as _i21;

import '../features/currency/data/datasources/remote_data_source.dart' as _i14;
import '../features/currency/data/repositories/currency_repository_impl.dart'
    as _i16;
import '../features/currency/domain/repositories/currency_repository.dart'
    as _i15;
import '../features/currency/domain/usecases/change_currency_usecase.dart'
    as _i26;
import '../features/currency/presentation/cubit/currency_cubit.dart' as _i27;
import '../features/institutions/data/datasources/institutions_service_api.dart'
    as _i4;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i20;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i19;
import '../features/institutions/domain/usecases/add_institution.dart' as _i23;
import '../features/institutions/domain/usecases/get_institutions.dart' as _i28;
import '../features/institutions/domain/usecases/update_institution.dart'
    as _i22;
import '../features/institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i24;
import '../features/institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i29;
import '../features/instutution_items/data/datasources/items_api_service.dart'
    as _i7;
import '../features/instutution_items/data/repositories/items_repository_impl.dart'
    as _i9;
import '../features/instutution_items/domain/repositories/items_repository.dart'
    as _i8;
import '../features/instutution_items/domain/usecases/add_instition_item.dart'
    as _i12;
import '../features/instutution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i13;
import '../features/instutution_items/domain/usecases/get_institution_items.dart'
    as _i17;
import '../features/instutution_items/domain/usecases/search_item.dart' as _i11;
import '../features/instutution_items/presentation/bloc/bloc/add_item_bloc.dart'
    as _i25;
import '../features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart'
    as _i18;
import 'register_module.dart' as _i30; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i4.InstitutionsServiceApi>(() =>
      _i4.InstitutionsServiceApiImpl(
          get<_i5.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i7.ItemsApiService>(() => _i7.ItemsApiServiceImpl(
      get<_i5.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i8.ItemsRepository>(() => _i9.ItemsRepositoryImpl(
      get<_i7.ItemsApiService>(), get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i11.SearchItem>(
      () => _i11.SearchItem(get<_i8.ItemsRepository>()));
  gh.lazySingleton<_i12.AddInstitutionItem>(
      () => _i12.AddInstitutionItem(get<_i8.ItemsRepository>()));
  gh.lazySingleton<_i13.AddRefAndInstitutionItem>(
      () => _i13.AddRefAndInstitutionItem(get<_i8.ItemsRepository>()));
  gh.lazySingleton<_i14.CurrencyApiService>(
      () => _i14.CurrencyApiService(get<_i3.Dio>()));
  gh.lazySingleton<_i15.CurrencyRepository>(() => _i16.CurrencyRepositoryImpl(
      get<_i14.CurrencyApiService>(), get<_i10.NetworkInfo>()));
  gh.lazySingleton<_i17.GetInstitutionItems>(
      () => _i17.GetInstitutionItems(get<_i8.ItemsRepository>()));
  gh.factory<_i18.InstitutionItemsCubit>(
      () => _i18.InstitutionItemsCubit(get<_i17.GetInstitutionItems>()));
  gh.lazySingleton<_i19.InstitutionsRepository>(() =>
      _i20.InstitutionsRepositoryImpl(
          get<_i4.InstitutionsServiceApi>(), get<_i21.NetworkInfo>()));
  gh.lazySingleton<_i22.UpdateInstitution>(
      () => _i22.UpdateInstitution(get<_i19.InstitutionsRepository>()));
  gh.lazySingleton<_i23.AddInstitution>(
      () => _i23.AddInstitution(get<_i19.InstitutionsRepository>()));
  gh.factory<_i24.AddInstitutionCubit>(() => _i24.AddInstitutionCubit(
      get<_i23.AddInstitution>(), get<_i22.UpdateInstitution>()));
  gh.factory<_i25.AddItemBloc>(() => _i25.AddItemBloc(get<_i11.SearchItem>(),
      get<_i12.AddInstitutionItem>(), get<_i13.AddRefAndInstitutionItem>()));
  gh.lazySingleton<_i26.ConvertCurrencyUseCase>(
      () => _i26.ConvertCurrencyUseCase(get<_i15.CurrencyRepository>()));
  gh.factory<_i27.CurrencyCubit>(
      () => _i27.CurrencyCubit(get<_i26.ConvertCurrencyUseCase>()));
  gh.lazySingleton<_i28.GetInstitutions>(
      () => _i28.GetInstitutions(get<_i19.InstitutionsRepository>()));
  gh.factory<_i29.InstitutionsCubit>(
      () => _i29.InstitutionsCubit(get<_i28.GetInstitutions>()));
  return get;
}

class _$RegisterModule extends _i30.RegisterModule {}
