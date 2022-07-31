// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/network_info.dart' as _i9;
import 'package:root_package/packages/cloud_firestore.dart' as _i6;
import 'package:root_package/packages/firebase_auth.dart' as _i12;
import 'package:root_package/root_package.dart' as _i18;

import '../features/currency/data/datasources/remote_data_source.dart' as _i25;
import '../features/currency/data/repositories/currency_repository_impl.dart'
    as _i27;
import '../features/currency/domain/repositories/currency_repository.dart'
    as _i26;
import '../features/currency/domain/usecases/change_currency_usecase.dart'
    as _i38;
import '../features/currency/presentation/cubit/currency_cubit.dart' as _i39;
import '../features/institutions/data/datasources/institutions_api_service.dart'
    as _i5;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i8;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i7;
import '../features/institutions/domain/usecases/get_institutions.dart' as _i29;
import '../features/institutions/presentation/cubit/institutions_cubit.dart'
    as _i32;
import '../features/instutution_items/data/datasources/items_api_service.dart'
    as _i11;
import '../features/instutution_items/data/repositories/items_repository_impl.dart'
    as _i15;
import '../features/instutution_items/domain/repositories/items_repository.dart'
    as _i14;
import '../features/instutution_items/domain/usecases/add_instition_item.dart'
    as _i23;
import '../features/instutution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i24;
import '../features/instutution_items/domain/usecases/get_institution_items.dart'
    as _i28;
import '../features/instutution_items/domain/usecases/search_item.dart' as _i20;
import '../features/instutution_items/domain/usecases/update_institution_item.dart'
    as _i21;
import '../features/instutution_items/presentation/bloc/bloc/add_item_bloc.dart'
    as _i37;
import '../features/instutution_items/presentation/cubit/institution_cart/institution_cart_cubit.dart'
    as _i4;
import '../features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart'
    as _i31;
import '../features/instutution_items/presentation/cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart'
    as _i10;
import '../features/items/data/datasources/items_api_servic.dart' as _i13;
import '../features/items/data/repositories/items_repository_impl.dart' as _i17;
import '../features/items/domain/repositories/items_repository.dart' as _i16;
import '../features/items/domain/usecases/get_items.dart' as _i30;
import '../features/items/presentation/cubit/items/items_cubit.dart' as _i33;
import '../features/items/presentation/cubit/items_widget/items_widget_cubit.dart'
    as _i19;
import '../features/user_institutions/data/datasources/user_institutions_service_api.dart'
    as _i22;
import '../features/user_institutions/data/repositories/institutions_repository_impl.dart'
    as _i35;
import '../features/user_institutions/domain/repositories/institutions_repository.dart'
    as _i34;
import '../features/user_institutions/domain/usecases/add_institution.dart'
    as _i36;
import '../features/user_institutions/domain/usecases/get_user_institutions.dart'
    as _i40;
import '../features/user_institutions/domain/usecases/update_institution.dart'
    as _i41;
import '../features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i43;
import '../features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i42;
import 'register_module.dart' as _i44; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.googleSignIn);
  gh.factory<_i4.InstitutionCartCubit>(() => _i4.InstitutionCartCubit());
  gh.lazySingleton<_i5.InstitutionsApiService>(
      () => _i5.InstitutionsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i7.InstitutionsRepository>(() =>
      _i8.InstitutionsRepositoryImpl(
          get<_i5.InstitutionsApiService>(), get<_i9.NetworkInfo>()));
  gh.factory<_i10.ItemAddToCartDialogCubit>(
      () => _i10.ItemAddToCartDialogCubit());
  gh.lazySingleton<_i11.ItemsApiService>(() => _i11.ItemsApiServiceImpl(
      get<_i12.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i13.ItemsApiService2>(
      () => _i13.ItemsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i14.ItemsRepository>(() => _i15.ItemsRepositoryImpl(
      get<_i11.ItemsApiService>(), get<_i9.NetworkInfo>()));
  gh.lazySingleton<_i16.ItemsRepository>(() => _i17.ItemsRepositoryImpl(
      get<_i13.ItemsApiService2>(), get<_i18.NetworkInfo>()));
  gh.factory<_i19.ItemsWidgetCubit>(() => _i19.ItemsWidgetCubit());
  gh.lazySingleton<_i20.SearchItem>(
      () => _i20.SearchItem(get<_i14.ItemsRepository>()));
  gh.lazySingleton<_i21.UpdateInstitutionItem>(
      () => _i21.UpdateInstitutionItem(get<_i14.ItemsRepository>()));
  gh.lazySingleton<_i22.UserInstitutionsServiceApi>(() =>
      _i22.UserInstitutionsServiceApiImpl(
          get<_i12.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i23.AddInstitutionItem>(
      () => _i23.AddInstitutionItem(get<_i14.ItemsRepository>()));
  gh.lazySingleton<_i24.AddRefAndInstitutionItem>(
      () => _i24.AddRefAndInstitutionItem(get<_i14.ItemsRepository>()));
  gh.lazySingleton<_i25.CurrencyApiService>(
      () => _i25.CurrencyApiService(get<_i3.Dio>()));
  gh.lazySingleton<_i26.CurrencyRepository>(() => _i27.CurrencyRepositoryImpl(
      get<_i25.CurrencyApiService>(), get<_i9.NetworkInfo>()));
  gh.lazySingleton<_i28.GetInstitutionItems>(
      () => _i28.GetInstitutionItems(get<_i14.ItemsRepository>()));
  gh.lazySingleton<_i29.GetInstitutions>(
      () => _i29.GetInstitutions(get<_i7.InstitutionsRepository>()));
  gh.lazySingleton<_i30.GetItems>(
      () => _i30.GetItems(get<_i16.ItemsRepository>()));
  gh.factory<_i31.InstitutionItemsCubit>(
      () => _i31.InstitutionItemsCubit(get<_i28.GetInstitutionItems>()));
  gh.factory<_i32.InstitutionsCubit>(
      () => _i32.InstitutionsCubit(get<_i29.GetInstitutions>()));
  gh.factory<_i33.ItemsCubit>(() => _i33.ItemsCubit(get<_i30.GetItems>()));
  gh.lazySingleton<_i34.UserInstitutionsRepository>(() =>
      _i35.UserInstitutionsRepositoryImpl(
          get<_i22.UserInstitutionsServiceApi>(), get<_i18.NetworkInfo>()));
  gh.lazySingleton<_i36.AddInstitution>(
      () => _i36.AddInstitution(get<_i34.UserInstitutionsRepository>()));
  gh.factory<_i37.AddItemBloc>(() => _i37.AddItemBloc(
      get<_i20.SearchItem>(),
      get<_i23.AddInstitutionItem>(),
      get<_i24.AddRefAndInstitutionItem>(),
      get<_i21.UpdateInstitutionItem>()));
  gh.lazySingleton<_i38.ConvertCurrencyUseCase>(
      () => _i38.ConvertCurrencyUseCase(get<_i26.CurrencyRepository>()));
  gh.factory<_i39.CurrencyCubit>(
      () => _i39.CurrencyCubit(get<_i38.ConvertCurrencyUseCase>()));
  gh.lazySingleton<_i40.GetUserInstitutions>(
      () => _i40.GetUserInstitutions(get<_i34.UserInstitutionsRepository>()));
  gh.lazySingleton<_i41.UpdateInstitution>(
      () => _i41.UpdateInstitution(get<_i34.UserInstitutionsRepository>()));
  gh.factory<_i42.UserInstitutionsCubit>(
      () => _i42.UserInstitutionsCubit(get<_i40.GetUserInstitutions>()));
  gh.factory<_i43.AddInstitutionCubit>(() => _i43.AddInstitutionCubit(
      get<_i36.AddInstitution>(), get<_i41.UpdateInstitution>()));
  return get;
}

class _$RegisterModule extends _i44.RegisterModule {}
