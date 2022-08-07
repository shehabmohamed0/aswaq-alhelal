// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:geo_logic/features/domain/usecases/get_current_location.dart'
    as _i27;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/network_info.dart' as _i24;
import 'package:root_package/packages/cloud_firestore.dart' as _i4;
import 'package:root_package/packages/firebase_auth.dart' as _i18;
import 'package:root_package/root_package.dart' as _i15;

import '../features/address_suggestions/data/datasources/address_suggestions_api_service.dart'
    as _i3;
import '../features/address_suggestions/data/repositories/address_suggestions_repository_impl.dart'
    as _i6;
import '../features/address_suggestions/domain/repositories/address_suggestions_repository.dart'
    as _i5;
import '../features/address_suggestions/domain/usecases/add_new_city.dart'
    as _i32;
import '../features/address_suggestions/domain/usecases/add_new_governate.dart'
    as _i33;
import '../features/address_suggestions/domain/usecases/add_new_neighborhood.dart'
    as _i34;
import '../features/address_suggestions/domain/usecases/get_cities_suggetsions.dart'
    as _i8;
import '../features/address_suggestions/domain/usecases/get_districts_suggestions.dart'
    as _i10;
import '../features/address_suggestions/domain/usecases/get_governates_suggestions.dart'
    as _i9;
import '../features/address_suggestions/presentation/bloc/address_suggestions_bloc.dart'
    as _i36;
import '../features/address_suggestions/presentation/cubit/cubit/location_widget_cubit.dart'
    as _i26;
import '../features/currency/data/datasources/remote_data_source.dart' as _i37;
import '../features/currency/data/repositories/currency_repository_impl.dart'
    as _i39;
import '../features/currency/domain/repositories/currency_repository.dart'
    as _i38;
import '../features/currency/domain/usecases/change_currency_usecase.dart'
    as _i51;
import '../features/currency/presentation/cubit/currency_cubit.dart' as _i52;
import '../features/home/data/datasources/items_api_servic.dart' as _i19;
import '../features/home/data/repositories/items_repository_impl.dart' as _i21;
import '../features/home/domain/repositories/items_repository.dart' as _i20;
import '../features/home/domain/usecases/get_items.dart' as _i42;
import '../features/home/presentation/cubit/items/items_cubit.dart' as _i45;
import '../features/home/presentation/cubit/items_widget/items_widget_cubit.dart'
    as _i25;
import '../features/institutions/data/datasources/institutions_api_service.dart'
    as _i12;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i14;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i13;
import '../features/institutions/domain/usecases/get_institutions.dart' as _i41;
import '../features/institutions/presentation/cubit/institutions_cubit.dart'
    as _i44;
import '../features/instutution_items/data/datasources/items_api_service.dart'
    as _i17;
import '../features/instutution_items/data/repositories/items_repository_impl.dart'
    as _i23;
import '../features/instutution_items/domain/repositories/items_repository.dart'
    as _i22;
import '../features/instutution_items/domain/usecases/add_instition_item.dart'
    as _i31;
import '../features/instutution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i35;
import '../features/instutution_items/domain/usecases/get_institution_items.dart'
    as _i40;
import '../features/instutution_items/domain/usecases/search_item.dart' as _i28;
import '../features/instutution_items/domain/usecases/update_institution_item.dart'
    as _i29;
import '../features/instutution_items/presentation/bloc/bloc/add_item_bloc.dart'
    as _i50;
import '../features/instutution_items/presentation/cubit/institution_cart/institution_cart_cubit.dart'
    as _i11;
import '../features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart'
    as _i43;
import '../features/instutution_items/presentation/cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart'
    as _i16;
import '../features/user_institutions/data/datasources/user_institutions_service_api.dart'
    as _i30;
import '../features/user_institutions/data/repositories/institutions_repository_impl.dart'
    as _i47;
import '../features/user_institutions/domain/repositories/institutions_repository.dart'
    as _i46;
import '../features/user_institutions/domain/usecases/add_institution.dart'
    as _i48;
import '../features/user_institutions/domain/usecases/get_user_institutions.dart'
    as _i53;
import '../features/user_institutions/domain/usecases/update_institution.dart'
    as _i54;
import '../features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i49;
import '../features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i55;
import 'register_module.dart' as _i56; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AddressSuggestionsApiService>(
      () => _i3.AddressSuggestionsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i5.AddressSuggestionsRepository>(() =>
      _i6.AddressSuggestionsRepositoryImpl(
          get<_i3.AddressSuggestionsApiService>()));
  gh.factory<_i7.Dio>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i8.GetCitiesSuggestions>(
      () => _i8.GetCitiesSuggestions(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i9.GetGovernatesSuggestions>(() =>
      _i9.GetGovernatesSuggestions(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i10.GetNeighborhoodsSuggestions>(() =>
      _i10.GetNeighborhoodsSuggestions(
          get<_i5.AddressSuggestionsRepository>()));
  gh.factory<_i11.InstitutionCartCubit>(() => _i11.InstitutionCartCubit());
  gh.lazySingleton<_i12.InstitutionsApiService>(
      () => _i12.InstitutionsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i13.InstitutionsRepository>(() =>
      _i14.InstitutionsRepositoryImpl(
          get<_i12.InstitutionsApiService>(), get<_i15.NetworkInfo>()));
  gh.factory<_i16.ItemAddToCartDialogCubit>(
      () => _i16.ItemAddToCartDialogCubit());
  gh.lazySingleton<_i17.ItemsApiService>(() => _i17.ItemsApiServiceImpl(
      get<_i18.FirebaseAuth>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i19.ItemsApiService2>(
      () => _i19.ItemsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i20.ItemsRepository>(() => _i21.ItemsRepositoryImpl(
      get<_i19.ItemsApiService2>(), get<_i15.NetworkInfo>()));
  gh.lazySingleton<_i22.ItemsRepository>(() => _i23.ItemsRepositoryImpl(
      get<_i17.ItemsApiService>(), get<_i24.NetworkInfo>()));
  gh.factory<_i25.ItemsWidgetCubit>(() => _i25.ItemsWidgetCubit());
  gh.factory<_i26.LocationWidgetCubit>(
      () => _i26.LocationWidgetCubit(get<_i27.GetCurrentLocation>()));
  gh.lazySingleton<_i28.SearchItem>(
      () => _i28.SearchItem(get<_i22.ItemsRepository>()));
  gh.lazySingleton<_i29.UpdateInstitutionItem>(
      () => _i29.UpdateInstitutionItem(get<_i22.ItemsRepository>()));
  gh.lazySingleton<_i30.UserInstitutionsServiceApi>(() =>
      _i30.UserInstitutionsServiceApiImpl(
          get<_i18.FirebaseAuth>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i31.AddInstitutionItem>(
      () => _i31.AddInstitutionItem(get<_i22.ItemsRepository>()));
  gh.lazySingleton<_i32.AddNewCity>(
      () => _i32.AddNewCity(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i33.AddNewGovernate>(
      () => _i33.AddNewGovernate(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i34.AddNewNeighborhood>(
      () => _i34.AddNewNeighborhood(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i35.AddRefAndInstitutionItem>(
      () => _i35.AddRefAndInstitutionItem(get<_i22.ItemsRepository>()));
  gh.factory<_i36.AddressSuggestionsBloc>(() => _i36.AddressSuggestionsBloc(
      get<_i9.GetGovernatesSuggestions>(),
      get<_i8.GetCitiesSuggestions>(),
      get<_i10.GetNeighborhoodsSuggestions>(),
      get<_i33.AddNewGovernate>(),
      get<_i32.AddNewCity>(),
      get<_i34.AddNewNeighborhood>()));
  gh.lazySingleton<_i37.CurrencyApiService>(
      () => _i37.CurrencyApiService(get<_i7.Dio>()));
  gh.lazySingleton<_i38.CurrencyRepository>(() => _i39.CurrencyRepositoryImpl(
      get<_i37.CurrencyApiService>(), get<_i24.NetworkInfo>()));
  gh.lazySingleton<_i40.GetInstitutionItems>(
      () => _i40.GetInstitutionItems(get<_i22.ItemsRepository>()));
  gh.lazySingleton<_i41.GetInstitutions>(
      () => _i41.GetInstitutions(get<_i13.InstitutionsRepository>()));
  gh.lazySingleton<_i42.GetItems>(
      () => _i42.GetItems(get<_i20.ItemsRepository>()));
  gh.factory<_i43.InstitutionItemsCubit>(
      () => _i43.InstitutionItemsCubit(get<_i40.GetInstitutionItems>()));
  gh.factory<_i44.InstitutionsCubit>(
      () => _i44.InstitutionsCubit(get<_i41.GetInstitutions>()));
  gh.factory<_i45.ItemsCubit>(() => _i45.ItemsCubit(get<_i42.GetItems>()));
  gh.lazySingleton<_i46.UserInstitutionsRepository>(() =>
      _i47.UserInstitutionsRepositoryImpl(
          get<_i30.UserInstitutionsServiceApi>(), get<_i15.NetworkInfo>()));
  gh.lazySingleton<_i48.AddInstitution>(
      () => _i48.AddInstitution(get<_i46.UserInstitutionsRepository>()));
  gh.factory<_i49.AddInstitutionCubit>(
      () => _i49.AddInstitutionCubit(get<_i48.AddInstitution>()));
  gh.factory<_i50.AddItemBloc>(() => _i50.AddItemBloc(
      get<_i28.SearchItem>(),
      get<_i31.AddInstitutionItem>(),
      get<_i35.AddRefAndInstitutionItem>(),
      get<_i29.UpdateInstitutionItem>()));
  gh.lazySingleton<_i51.ConvertCurrencyUseCase>(
      () => _i51.ConvertCurrencyUseCase(get<_i38.CurrencyRepository>()));
  gh.factory<_i52.CurrencyCubit>(
      () => _i52.CurrencyCubit(get<_i51.ConvertCurrencyUseCase>()));
  gh.lazySingleton<_i53.GetUserInstitutions>(
      () => _i53.GetUserInstitutions(get<_i46.UserInstitutionsRepository>()));
  gh.lazySingleton<_i54.UpdateInstitution>(
      () => _i54.UpdateInstitution(get<_i46.UserInstitutionsRepository>()));
  gh.factory<_i55.UserInstitutionsCubit>(
      () => _i55.UserInstitutionsCubit(get<_i53.GetUserInstitutions>()));
  return get;
}

class _$RegisterModule extends _i56.RegisterModule {}
