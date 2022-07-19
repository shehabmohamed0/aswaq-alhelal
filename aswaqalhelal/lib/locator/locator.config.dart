// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/network_info.dart' as _i8;
import 'package:root_package/packages/cloud_firestore.dart' as _i5;
import 'package:root_package/packages/firebase_auth.dart' as _i10;
import 'package:root_package/root_package.dart' as _i16;

import '../features/currency/data/datasources/remote_data_source.dart' as _i22;
import '../features/currency/data/repositories/currency_repository_impl.dart'
    as _i24;
import '../features/currency/domain/repositories/currency_repository.dart'
    as _i23;
import '../features/currency/domain/usecases/change_currency_usecase.dart'
    as _i35;
import '../features/currency/presentation/cubit/currency_cubit.dart' as _i36;
import '../features/institutions/data/datasources/institutions_api_service.dart'
    as _i4;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i7;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i6;
import '../features/institutions/domain/usecases/get_institutions.dart' as _i26;
import '../features/institutions/presentation/cubit/institutions_cubit.dart'
    as _i29;
import '../features/instutution_items/data/datasources/items_api_service.dart'
    as _i9;
import '../features/instutution_items/data/repositories/items_repository_impl.dart'
    as _i13;
import '../features/instutution_items/domain/repositories/items_repository.dart'
    as _i12;
import '../features/instutution_items/domain/usecases/add_instition_item.dart'
    as _i20;
import '../features/instutution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i21;
import '../features/instutution_items/domain/usecases/get_institution_items.dart'
    as _i25;
import '../features/instutution_items/domain/usecases/search_item.dart' as _i18;
import '../features/instutution_items/presentation/bloc/bloc/add_item_bloc.dart'
    as _i34;
import '../features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart'
    as _i28;
import '../features/items/data/datasources/items_api_servic.dart' as _i11;
import '../features/items/data/repositories/items_repository_impl.dart' as _i15;
import '../features/items/domain/repositories/items_repository.dart' as _i14;
import '../features/items/domain/usecases/get_items.dart' as _i27;
import '../features/items/presentation/cubit/items/items_cubit.dart' as _i30;
import '../features/items/presentation/cubit/items_widget/items_widget_cubit.dart'
    as _i17;
import '../features/user_institutions/data/datasources/user_institutions_service_api.dart'
    as _i19;
import '../features/user_institutions/data/repositories/institutions_repository_impl.dart'
    as _i32;
import '../features/user_institutions/domain/repositories/institutions_repository.dart'
    as _i31;
import '../features/user_institutions/domain/usecases/add_institution.dart'
    as _i33;
import '../features/user_institutions/domain/usecases/get_user_institutions.dart'
    as _i37;
import '../features/user_institutions/domain/usecases/update_institution.dart'
    as _i39;
import '../features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i40;
import '../features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i38;
import 'register_module.dart' as _i41; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i4.InstitutionsApiService>(
      () => _i4.InstitutionsApiServiceImpl(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i6.InstitutionsRepository>(() =>
      _i7.InstitutionsRepositoryImpl(
          get<_i4.InstitutionsApiService>(), get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i9.ItemsApiService>(() => _i9.ItemsApiServiceImpl(
      get<_i10.FirebaseAuth>(), get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i11.ItemsApiService2>(
      () => _i11.ItemsApiServiceImpl(get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i12.ItemsRepository>(() => _i13.ItemsRepositoryImpl(
      get<_i9.ItemsApiService>(), get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i14.ItemsRepository>(() => _i15.ItemsRepositoryImpl(
      get<_i11.ItemsApiService2>(), get<_i16.NetworkInfo>()));
  gh.factory<_i17.ItemsWidgetCubit>(() => _i17.ItemsWidgetCubit());
  gh.lazySingleton<_i18.SearchItem>(
      () => _i18.SearchItem(get<_i12.ItemsRepository>()));
  gh.lazySingleton<_i19.UserInstitutionsServiceApi>(() =>
      _i19.UserInstitutionsServiceApiImpl(
          get<_i10.FirebaseAuth>(), get<_i5.FirebaseFirestore>()));
  gh.lazySingleton<_i20.AddInstitutionItem>(
      () => _i20.AddInstitutionItem(get<_i12.ItemsRepository>()));
  gh.lazySingleton<_i21.AddRefAndInstitutionItem>(
      () => _i21.AddRefAndInstitutionItem(get<_i12.ItemsRepository>()));
  gh.lazySingleton<_i22.CurrencyApiService>(
      () => _i22.CurrencyApiService(get<_i3.Dio>()));
  gh.lazySingleton<_i23.CurrencyRepository>(() => _i24.CurrencyRepositoryImpl(
      get<_i22.CurrencyApiService>(), get<_i8.NetworkInfo>()));
  gh.lazySingleton<_i25.GetInstitutionItems>(
      () => _i25.GetInstitutionItems(get<_i12.ItemsRepository>()));
  gh.lazySingleton<_i26.GetInstitutions>(
      () => _i26.GetInstitutions(get<_i6.InstitutionsRepository>()));
  gh.lazySingleton<_i27.GetItems>(
      () => _i27.GetItems(get<_i14.ItemsRepository>()));
  gh.factory<_i28.InstitutionItemsCubit>(
      () => _i28.InstitutionItemsCubit(get<_i25.GetInstitutionItems>()));
  gh.factory<_i29.InstitutionsCubit>(
      () => _i29.InstitutionsCubit(get<_i26.GetInstitutions>()));
  gh.factory<_i30.ItemsCubit>(() => _i30.ItemsCubit(get<_i27.GetItems>()));
  gh.lazySingleton<_i31.UserInstitutionsRepository>(() =>
      _i32.UserInstitutionsRepositoryImpl(
          get<_i19.UserInstitutionsServiceApi>(), get<_i16.NetworkInfo>()));
  gh.lazySingleton<_i33.AddInstitution>(
      () => _i33.AddInstitution(get<_i31.UserInstitutionsRepository>()));
  gh.factory<_i34.AddItemBloc>(() => _i34.AddItemBloc(get<_i18.SearchItem>(),
      get<_i20.AddInstitutionItem>(), get<_i21.AddRefAndInstitutionItem>()));
  gh.lazySingleton<_i35.ConvertCurrencyUseCase>(
      () => _i35.ConvertCurrencyUseCase(get<_i23.CurrencyRepository>()));
  gh.factory<_i36.CurrencyCubit>(
      () => _i36.CurrencyCubit(get<_i35.ConvertCurrencyUseCase>()));
  gh.lazySingleton<_i37.GetUserInstitutions>(
      () => _i37.GetUserInstitutions(get<_i31.UserInstitutionsRepository>()));
  gh.factory<_i38.UserInstitutionsCubit>(
      () => _i38.UserInstitutionsCubit(get<_i37.GetUserInstitutions>()));
  gh.lazySingleton<_i39.UpdateInstitution>(
      () => _i39.UpdateInstitution(get<_i31.UserInstitutionsRepository>()));
  gh.factory<_i40.AddInstitutionCubit>(() => _i40.AddInstitutionCubit(
      get<_i33.AddInstitution>(), get<_i39.UpdateInstitution>()));
  return get;
}

class _$RegisterModule extends _i41.RegisterModule {}
