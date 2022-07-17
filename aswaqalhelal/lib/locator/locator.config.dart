// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/network_info.dart' as _i11;
import 'package:root_package/packages/cloud_firestore.dart' as _i6;
import 'package:root_package/packages/firebase_auth.dart' as _i5;
import 'package:root_package/root_package.dart' as _i14;

import '../features/currency/data/datasources/remote_data_source.dart' as _i18;
import '../features/currency/data/repositories/currency_repository_impl.dart'
    as _i20;
import '../features/currency/domain/repositories/currency_repository.dart'
    as _i19;
import '../features/currency/domain/usecases/change_currency_usecase.dart'
    as _i31;
import '../features/currency/presentation/cubit/currency_cubit.dart' as _i32;
import '../features/institutions/data/datasources/institutions_service_api.dart'
    as _i4;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i25;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i24;
import '../features/institutions/domain/usecases/add_institution.dart' as _i28;
import '../features/institutions/domain/usecases/get_institutions.dart' as _i33;
import '../features/institutions/domain/usecases/update_institution.dart'
    as _i27;
import '../features/institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i29;
import '../features/institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i34;
import '../features/instutution_items/data/datasources/items_api_service.dart'
    as _i7;
import '../features/instutution_items/data/repositories/items_repository_impl.dart'
    as _i10;
import '../features/instutution_items/domain/repositories/items_repository.dart'
    as _i9;
import '../features/instutution_items/domain/usecases/add_instition_item.dart'
    as _i16;
import '../features/instutution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i17;
import '../features/instutution_items/domain/usecases/get_institution_items.dart'
    as _i21;
import '../features/instutution_items/domain/usecases/search_item.dart' as _i15;
import '../features/instutution_items/presentation/bloc/bloc/add_item_bloc.dart'
    as _i30;
import '../features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart'
    as _i23;
import '../features/items/data/datasources/items_api_servic.dart' as _i8;
import '../features/items/data/repositories/items_repository_impl.dart' as _i13;
import '../features/items/domain/repositories/items_repository.dart' as _i12;
import '../features/items/domain/usecases/get_items.dart' as _i22;
import '../features/items/presentation/cubit/items/items_cubit.dart' as _i26;
import 'register_module.dart' as _i35; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i8.ItemsApiService2>(
      () => _i8.ItemsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i9.ItemsRepository>(() => _i10.ItemsRepositoryImpl(
      get<_i7.ItemsApiService>(), get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i12.ItemsRepository>(() => _i13.ItemsRepositoryImpl(
      get<_i8.ItemsApiService2>(), get<_i14.NetworkInfo>()));
  gh.lazySingleton<_i15.SearchItem>(
      () => _i15.SearchItem(get<_i9.ItemsRepository>()));
  gh.lazySingleton<_i16.AddInstitutionItem>(
      () => _i16.AddInstitutionItem(get<_i9.ItemsRepository>()));
  gh.lazySingleton<_i17.AddRefAndInstitutionItem>(
      () => _i17.AddRefAndInstitutionItem(get<_i9.ItemsRepository>()));
  gh.lazySingleton<_i18.CurrencyApiService>(
      () => _i18.CurrencyApiService(get<_i3.Dio>()));
  gh.lazySingleton<_i19.CurrencyRepository>(() => _i20.CurrencyRepositoryImpl(
      get<_i18.CurrencyApiService>(), get<_i11.NetworkInfo>()));
  gh.lazySingleton<_i21.GetInstitutionItems>(
      () => _i21.GetInstitutionItems(get<_i9.ItemsRepository>()));
  gh.lazySingleton<_i22.GetItems>(
      () => _i22.GetItems(get<_i12.ItemsRepository>()));
  gh.factory<_i23.InstitutionItemsCubit>(
      () => _i23.InstitutionItemsCubit(get<_i21.GetInstitutionItems>()));
  gh.lazySingleton<_i24.InstitutionsRepository>(() =>
      _i25.InstitutionsRepositoryImpl(
          get<_i4.InstitutionsServiceApi>(), get<_i14.NetworkInfo>()));
  gh.factory<_i26.ItemsCubit>(() => _i26.ItemsCubit(get<_i22.GetItems>()));
  gh.lazySingleton<_i27.UpdateInstitution>(
      () => _i27.UpdateInstitution(get<_i24.InstitutionsRepository>()));
  gh.lazySingleton<_i28.AddInstitution>(
      () => _i28.AddInstitution(get<_i24.InstitutionsRepository>()));
  gh.factory<_i29.AddInstitutionCubit>(() => _i29.AddInstitutionCubit(
      get<_i28.AddInstitution>(), get<_i27.UpdateInstitution>()));
  gh.factory<_i30.AddItemBloc>(() => _i30.AddItemBloc(get<_i15.SearchItem>(),
      get<_i16.AddInstitutionItem>(), get<_i17.AddRefAndInstitutionItem>()));
  gh.lazySingleton<_i31.ConvertCurrencyUseCase>(
      () => _i31.ConvertCurrencyUseCase(get<_i19.CurrencyRepository>()));
  gh.factory<_i32.CurrencyCubit>(
      () => _i32.CurrencyCubit(get<_i31.ConvertCurrencyUseCase>()));
  gh.lazySingleton<_i33.GetInstitutions>(
      () => _i33.GetInstitutions(get<_i24.InstitutionsRepository>()));
  gh.factory<_i34.InstitutionsCubit>(
      () => _i34.InstitutionsCubit(get<_i33.GetInstitutions>()));
  return get;
}

class _$RegisterModule extends _i35.RegisterModule {}
