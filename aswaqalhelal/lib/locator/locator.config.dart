// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/network_info.dart' as _i17;
import 'package:root_package/packages/cloud_firestore.dart' as _i4;
import 'package:root_package/packages/firebase_auth.dart' as _i9;
import 'package:root_package/root_package.dart' as _i26;

import '../features/address/data/datasources/address_local_data_source.dart'
    as _i7;
import '../features/address/data/datasources/addresses_service_api.dart' as _i8;
import '../features/address/data/repositories/addresses_repository_impl.dart'
    as _i47;
import '../features/address/domain/repositories/addresses_repository.dart'
    as _i46;
import '../features/address/domain/usecases/add_address.dart' as _i66;
import '../features/address/domain/usecases/get_addresses.dart' as _i52;
import '../features/address/domain/usecases/get_current_location.dart' as _i53;
import '../features/address/domain/usecases/remove_address.dart' as _i61;
import '../features/address/domain/usecases/update_address.dart' as _i63;
import '../features/address/presentation/bloc/select_location_map/select_location_map_bloc.dart'
    as _i62;
import '../features/address/presentation/cubit/addresses/addresses_cubit.dart'
    as _i70;
import '../features/address_suggestions/data/datasources/address_suggestions_api_service.dart'
    as _i3;
import '../features/address_suggestions/data/repositories/address_suggestions_repository_impl.dart'
    as _i6;
import '../features/address_suggestions/domain/repositories/address_suggestions_repository.dart'
    as _i5;
import '../features/address_suggestions/domain/usecases/add_new_city.dart'
    as _i41;
import '../features/address_suggestions/domain/usecases/add_new_governate.dart'
    as _i42;
import '../features/address_suggestions/domain/usecases/add_new_neighborhood.dart'
    as _i43;
import '../features/address_suggestions/domain/usecases/get_cities_suggetsions.dart'
    as _i18;
import '../features/address_suggestions/domain/usecases/get_districts_suggestions.dart'
    as _i21;
import '../features/address_suggestions/domain/usecases/get_governates_suggestions.dart'
    as _i20;
import '../features/address_suggestions/domain/usecases/usecases.dart' as _i13;
import '../features/address_suggestions/presentation/bloc/address_suggestions_bloc.dart'
    as _i45;
import '../features/address_suggestions/presentation/cubit/cubit/location_widget_cubit.dart'
    as _i60;
import '../features/currency/data/datasources/remote_data_source.dart' as _i48;
import '../features/currency/data/repositories/currency_repository_impl.dart'
    as _i50;
import '../features/currency/domain/repositories/currency_repository.dart'
    as _i49;
import '../features/currency/domain/usecases/change_currency_usecase.dart'
    as _i71;
import '../features/currency/presentation/cubit/currency_cubit.dart' as _i72;
import '../features/distribution_areas/data/datasources/distribution_area_api_service.dart'
    as _i11;
import '../features/distribution_areas/data/repositories/distribution_areas_repository_impl.dart'
    as _i16;
import '../features/distribution_areas/domain/repositories/distribution_area_repository.dart'
    as _i15;
import '../features/distribution_areas/domain/usecases/add_distribution_area.dart'
    as _i39;
import '../features/distribution_areas/domain/usecases/delete_distribution_area.dart'
    as _i51;
import '../features/distribution_areas/domain/usecases/get_distribution_areas.dart'
    as _i19;
import '../features/distribution_areas/domain/usecases/update_distribution_area.dart'
    as _i36;
import '../features/distribution_areas/domain/usecases/usecases.dart' as _i14;
import '../features/distribution_areas/presentation/bloc/distribution_areas_bloc.dart'
    as _i12;
import '../features/home/data/datasources/items_api_servic.dart' as _i29;
import '../features/home/data/repositories/items_repository_impl.dart' as _i33;
import '../features/home/domain/repositories/items_repository.dart' as _i32;
import '../features/home/domain/usecases/get_items.dart' as _i56;
import '../features/home/presentation/cubit/items/items_cubit.dart' as _i59;
import '../features/home/presentation/cubit/items_widget/items_widget_cubit.dart'
    as _i34;
import '../features/institutions/data/datasources/institutions_api_service.dart'
    as _i23;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i25;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i24;
import '../features/institutions/domain/usecases/get_institutions.dart' as _i55;
import '../features/institutions/presentation/cubit/institutions_cubit.dart'
    as _i58;
import '../features/instutution_items/data/datasources/items_api_service.dart'
    as _i28;
import '../features/instutution_items/data/repositories/items_repository_impl.dart'
    as _i31;
import '../features/instutution_items/domain/repositories/items_repository.dart'
    as _i30;
import '../features/instutution_items/domain/usecases/add_instition_item.dart'
    as _i40;
import '../features/instutution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i44;
import '../features/instutution_items/domain/usecases/get_institution_items.dart'
    as _i54;
import '../features/instutution_items/domain/usecases/search_item.dart' as _i35;
import '../features/instutution_items/domain/usecases/update_institution_item.dart'
    as _i37;
import '../features/instutution_items/presentation/bloc/bloc/add_item_bloc.dart'
    as _i69;
import '../features/instutution_items/presentation/cubit/institution_cart/institution_cart_cubit.dart'
    as _i22;
import '../features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart'
    as _i57;
import '../features/instutution_items/presentation/cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart'
    as _i27;
import '../features/user_institutions/data/datasources/user_institutions_service_api.dart'
    as _i38;
import '../features/user_institutions/data/repositories/institutions_repository_impl.dart'
    as _i65;
import '../features/user_institutions/domain/repositories/institutions_repository.dart'
    as _i64;
import '../features/user_institutions/domain/usecases/add_institution.dart'
    as _i67;
import '../features/user_institutions/domain/usecases/get_user_institutions.dart'
    as _i73;
import '../features/user_institutions/domain/usecases/update_institution.dart'
    as _i74;
import '../features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i68;
import '../features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i75;
import 'register_module.dart' as _i76; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.AddressesLocalDataSource>(
      () => _i7.AddressesLocalDataSourceImpl());
  gh.lazySingleton<_i8.AddressesServiceApi>(() => _i8.AddressesServiceApiImpl(
      get<_i9.FirebaseAuth>(), get<_i4.FirebaseFirestore>()));
  gh.factory<_i10.Dio>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i11.DistributionAreaApiService>(
      () => _i11.DistributionAreaApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.factory<_i12.DistributionAreasBloc>(() => _i12.DistributionAreasBloc(
      get<_i13.GetGovernatesSuggestions>(),
      get<_i13.GetCitiesSuggestions>(),
      get<_i13.GetNeighborhoodsSuggestions>(),
      get<_i13.AddNewGovernate>(),
      get<_i13.AddNewCity>(),
      get<_i13.AddNewNeighborhood>(),
      get<_i14.GetDistributionAreas>(),
      get<_i14.AddDistributionArea>(),
      get<_i14.UpdateDistributionArea>(),
      get<_i14.DeleteDistributionArea>()));
  gh.lazySingleton<_i15.DistributionAreasRepository>(() =>
      _i16.DistributionAreasRepositoryImpl(
          get<_i11.DistributionAreaApiService>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i18.GetCitiesSuggestions>(
      () => _i18.GetCitiesSuggestions(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i19.GetDistributionAreas>(
      () => _i19.GetDistributionAreas(get<_i15.DistributionAreasRepository>()));
  gh.lazySingleton<_i20.GetGovernatesSuggestions>(() =>
      _i20.GetGovernatesSuggestions(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i21.GetNeighborhoodsSuggestions>(() =>
      _i21.GetNeighborhoodsSuggestions(
          get<_i5.AddressSuggestionsRepository>()));
  gh.factory<_i22.InstitutionCartCubit>(() => _i22.InstitutionCartCubit());
  gh.lazySingleton<_i23.InstitutionsApiService>(
      () => _i23.InstitutionsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i24.InstitutionsRepository>(() =>
      _i25.InstitutionsRepositoryImpl(
          get<_i23.InstitutionsApiService>(), get<_i26.NetworkInfo>()));
  gh.factory<_i27.ItemAddToCartDialogCubit>(
      () => _i27.ItemAddToCartDialogCubit());
  gh.lazySingleton<_i28.ItemsApiService>(() => _i28.ItemsApiServiceImpl(
      get<_i9.FirebaseAuth>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i29.ItemsApiService2>(
      () => _i29.ItemsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i30.ItemsRepository>(() => _i31.ItemsRepositoryImpl(
      get<_i28.ItemsApiService>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i32.ItemsRepository>(() => _i33.ItemsRepositoryImpl(
      get<_i29.ItemsApiService2>(), get<_i26.NetworkInfo>()));
  gh.factory<_i34.ItemsWidgetCubit>(() => _i34.ItemsWidgetCubit());
  gh.lazySingleton<_i35.SearchItem>(
      () => _i35.SearchItem(get<_i30.ItemsRepository>()));
  gh.lazySingleton<_i36.UpdateDistributionArea>(() =>
      _i36.UpdateDistributionArea(get<_i15.DistributionAreasRepository>()));
  gh.lazySingleton<_i37.UpdateInstitutionItem>(
      () => _i37.UpdateInstitutionItem(get<_i30.ItemsRepository>()));
  gh.lazySingleton<_i38.UserInstitutionsServiceApi>(() =>
      _i38.UserInstitutionsServiceApiImpl(
          get<_i9.FirebaseAuth>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i39.AddDistributionArea>(
      () => _i39.AddDistributionArea(get<_i15.DistributionAreasRepository>()));
  gh.lazySingleton<_i40.AddInstitutionItem>(
      () => _i40.AddInstitutionItem(get<_i30.ItemsRepository>()));
  gh.lazySingleton<_i41.AddNewCity>(
      () => _i41.AddNewCity(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i42.AddNewGovernate>(
      () => _i42.AddNewGovernate(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i43.AddNewNeighborhood>(
      () => _i43.AddNewNeighborhood(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i44.AddRefAndInstitutionItem>(
      () => _i44.AddRefAndInstitutionItem(get<_i30.ItemsRepository>()));
  gh.factory<_i45.AddressSuggestionsBloc>(() => _i45.AddressSuggestionsBloc(
      get<_i20.GetGovernatesSuggestions>(),
      get<_i18.GetCitiesSuggestions>(),
      get<_i21.GetNeighborhoodsSuggestions>(),
      get<_i42.AddNewGovernate>(),
      get<_i41.AddNewCity>(),
      get<_i43.AddNewNeighborhood>()));
  gh.lazySingleton<_i46.AddressesRepository>(() => _i47.AddressesRepositoryImpl(
      get<_i8.AddressesServiceApi>(),
      get<_i17.NetworkInfo>(),
      get<_i7.AddressesLocalDataSource>()));
  gh.lazySingleton<_i48.CurrencyApiService>(
      () => _i48.CurrencyApiService(get<_i10.Dio>()));
  gh.lazySingleton<_i49.CurrencyRepository>(() => _i50.CurrencyRepositoryImpl(
      get<_i48.CurrencyApiService>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i51.DeleteDistributionArea>(() =>
      _i51.DeleteDistributionArea(get<_i15.DistributionAreasRepository>()));
  gh.lazySingleton<_i52.GetAddresses>(
      () => _i52.GetAddresses(get<_i46.AddressesRepository>()));
  gh.lazySingleton<_i53.GetCurrentLocation>(
      () => _i53.GetCurrentLocation(get<_i46.AddressesRepository>()));
  gh.lazySingleton<_i54.GetInstitutionItems>(
      () => _i54.GetInstitutionItems(get<_i30.ItemsRepository>()));
  gh.lazySingleton<_i55.GetInstitutions>(
      () => _i55.GetInstitutions(get<_i24.InstitutionsRepository>()));
  gh.lazySingleton<_i56.GetItems>(
      () => _i56.GetItems(get<_i32.ItemsRepository>()));
  gh.factory<_i57.InstitutionItemsCubit>(
      () => _i57.InstitutionItemsCubit(get<_i54.GetInstitutionItems>()));
  gh.factory<_i58.InstitutionsCubit>(
      () => _i58.InstitutionsCubit(get<_i55.GetInstitutions>()));
  gh.factory<_i59.ItemsCubit>(() => _i59.ItemsCubit(get<_i56.GetItems>()));
  gh.factory<_i60.LocationWidgetCubit>(
      () => _i60.LocationWidgetCubit(get<_i53.GetCurrentLocation>()));
  gh.lazySingleton<_i61.RemoveAddress>(
      () => _i61.RemoveAddress(get<_i46.AddressesRepository>()));
  gh.factory<_i62.SelectLocationMapBloc>(
      () => _i62.SelectLocationMapBloc(get<_i53.GetCurrentLocation>()));
  gh.lazySingleton<_i63.UpdateAddress>(
      () => _i63.UpdateAddress(get<_i46.AddressesRepository>()));
  gh.lazySingleton<_i64.UserInstitutionsRepository>(() =>
      _i65.UserInstitutionsRepositoryImpl(
          get<_i38.UserInstitutionsServiceApi>(), get<_i26.NetworkInfo>()));
  gh.lazySingleton<_i66.AddAddress>(
      () => _i66.AddAddress(get<_i46.AddressesRepository>()));
  gh.lazySingleton<_i67.AddInstitution>(
      () => _i67.AddInstitution(get<_i64.UserInstitutionsRepository>()));
  gh.factory<_i68.AddInstitutionCubit>(
      () => _i68.AddInstitutionCubit(get<_i67.AddInstitution>()));
  gh.factory<_i69.AddItemBloc>(() => _i69.AddItemBloc(
      get<_i35.SearchItem>(),
      get<_i40.AddInstitutionItem>(),
      get<_i44.AddRefAndInstitutionItem>(),
      get<_i37.UpdateInstitutionItem>()));
  gh.factory<_i70.AddressesCubit>(() => _i70.AddressesCubit(
      get<_i52.GetAddresses>(),
      get<_i66.AddAddress>(),
      get<_i63.UpdateAddress>()));
  gh.lazySingleton<_i71.ConvertCurrencyUseCase>(
      () => _i71.ConvertCurrencyUseCase(get<_i49.CurrencyRepository>()));
  gh.factory<_i72.CurrencyCubit>(
      () => _i72.CurrencyCubit(get<_i71.ConvertCurrencyUseCase>()));
  gh.lazySingleton<_i73.GetUserInstitutions>(
      () => _i73.GetUserInstitutions(get<_i64.UserInstitutionsRepository>()));
  gh.lazySingleton<_i74.UpdateInstitution>(
      () => _i74.UpdateInstitution(get<_i64.UserInstitutionsRepository>()));
  gh.factory<_i75.UserInstitutionsCubit>(
      () => _i75.UserInstitutionsCubit(get<_i73.GetUserInstitutions>()));
  return get;
}

class _$RegisterModule extends _i76.RegisterModule {}
