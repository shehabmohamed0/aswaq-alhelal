// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/network_info.dart' as _i20;
import 'package:root_package/packages/cloud_firestore.dart' as _i6;
import 'package:root_package/packages/firebase_auth.dart' as _i11;
import 'package:root_package/packages/shared_preferences.dart' as _i39;
import 'package:root_package/root_package.dart' as _i36;

import '../features/address/data/datasources/address_local_data_source.dart'
    as _i9;
import '../features/address/data/datasources/addresses_service_api.dart'
    as _i10;
import '../features/address/data/repositories/addresses_repository_impl.dart'
    as _i54;
import '../features/address/domain/repositories/addresses_repository.dart'
    as _i53;
import '../features/address/domain/usecases/add_address.dart' as _i75;
import '../features/address/domain/usecases/get_addresses.dart' as _i60;
import '../features/address/domain/usecases/get_current_location.dart' as _i61;
import '../features/address/domain/usecases/remove_address.dart' as _i69;
import '../features/address/domain/usecases/update_address.dart' as _i72;
import '../features/address/domain/usecases/usecases.dart' as _i4;
import '../features/address/presentation/bloc/select_location_map/select_location_map_bloc.dart'
    as _i70;
import '../features/address/presentation/cubit/add_edit_address/add_edit_address_cubit.dart'
    as _i3;
import '../features/address/presentation/cubit/addresses/addresses_cubit.dart'
    as _i79;
import '../features/address_suggestions/data/datasources/address_suggestions_api_service.dart'
    as _i5;
import '../features/address_suggestions/data/repositories/address_suggestions_repository_impl.dart'
    as _i8;
import '../features/address_suggestions/domain/repositories/address_suggestions_repository.dart'
    as _i7;
import '../features/address_suggestions/domain/usecases/add_new_city.dart'
    as _i48;
import '../features/address_suggestions/domain/usecases/add_new_governate.dart'
    as _i49;
import '../features/address_suggestions/domain/usecases/add_new_neighborhood.dart'
    as _i50;
import '../features/address_suggestions/domain/usecases/get_cities_suggetsions.dart'
    as _i21;
import '../features/address_suggestions/domain/usecases/get_districts_suggestions.dart'
    as _i24;
import '../features/address_suggestions/domain/usecases/get_governates_suggestions.dart'
    as _i23;
import '../features/address_suggestions/domain/usecases/usecases.dart' as _i13;
import '../features/address_suggestions/presentation/bloc/address_suggestions2_bloc.dart'
    as _i12;
import '../features/address_suggestions/presentation/bloc/address_suggestions_bloc.dart'
    as _i52;
import '../features/address_suggestions/presentation/cubit/location_widget/location_widget_cubit.dart'
    as _i68;
import '../features/currency/data/datasources/remote_data_source.dart' as _i56;
import '../features/currency/data/repositories/currency_repository_impl.dart'
    as _i58;
import '../features/currency/domain/repositories/currency_repository.dart'
    as _i57;
import '../features/currency/domain/usecases/change_currency_usecase.dart'
    as _i80;
import '../features/currency/presentation/cubit/currency_cubit.dart' as _i81;
import '../features/distribution_areas/data/datasources/distribution_area_api_service.dart'
    as _i15;
import '../features/distribution_areas/data/repositories/distribution_areas_repository_impl.dart'
    as _i19;
import '../features/distribution_areas/domain/repositories/distribution_area_repository.dart'
    as _i18;
import '../features/distribution_areas/domain/usecases/add_distribution_area.dart'
    as _i46;
import '../features/distribution_areas/domain/usecases/delete_distribution_area.dart'
    as _i59;
import '../features/distribution_areas/domain/usecases/get_distribution_areas.dart'
    as _i22;
import '../features/distribution_areas/domain/usecases/update_distribution_area.dart'
    as _i43;
import '../features/distribution_areas/domain/usecases/usecases.dart' as _i17;
import '../features/distribution_areas/presentation/bloc/distribution_areas_bloc.dart'
    as _i16;
import '../features/home/data/datasources/items_api_servic.dart' as _i31;
import '../features/home/data/repositories/items_repository_impl.dart' as _i35;
import '../features/home/domain/repositories/items_repository.dart' as _i34;
import '../features/home/domain/usecases/get_items.dart' as _i64;
import '../features/home/presentation/cubit/items/items_cubit.dart' as _i67;
import '../features/home/presentation/cubit/items_widget/items_widget_cubit.dart'
    as _i37;
import '../features/institutions/data/datasources/institutions_api_service.dart'
    as _i26;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i28;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i27;
import '../features/institutions/domain/usecases/get_institutions.dart' as _i63;
import '../features/institutions/presentation/cubit/institutions_cubit.dart'
    as _i66;
import '../features/instutution_items/data/datasources/items_api_service.dart'
    as _i30;
import '../features/instutution_items/data/repositories/items_repository_impl.dart'
    as _i33;
import '../features/instutution_items/domain/repositories/items_repository.dart'
    as _i32;
import '../features/instutution_items/domain/usecases/add_instition_item.dart'
    as _i47;
import '../features/instutution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i51;
import '../features/instutution_items/domain/usecases/get_institution_items.dart'
    as _i62;
import '../features/instutution_items/domain/usecases/search_item.dart' as _i40;
import '../features/instutution_items/domain/usecases/update_institution_item.dart'
    as _i44;
import '../features/instutution_items/presentation/bloc/bloc/add_item_bloc.dart'
    as _i78;
import '../features/instutution_items/presentation/cubit/institution_cart/institution_cart_cubit.dart'
    as _i25;
import '../features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart'
    as _i65;
import '../features/instutution_items/presentation/cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart'
    as _i29;
import '../features/start_up/data/datasources/local_data_source.dart' as _i38;
import '../features/start_up/data/repositories/start_up_repository_impl.dart'
    as _i42;
import '../features/start_up/domain/repositories/start_up_repository.dart'
    as _i41;
import '../features/start_up/domain/usecases/check_if_seen_before.dart' as _i55;
import '../features/start_up/presentation/cubit/cubit/start_up_cubit.dart'
    as _i71;
import '../features/user_institutions/data/datasources/user_institutions_service_api.dart'
    as _i45;
import '../features/user_institutions/data/repositories/institutions_repository_impl.dart'
    as _i74;
import '../features/user_institutions/domain/repositories/institutions_repository.dart'
    as _i73;
import '../features/user_institutions/domain/usecases/add_institution.dart'
    as _i76;
import '../features/user_institutions/domain/usecases/get_user_institutions.dart'
    as _i82;
import '../features/user_institutions/domain/usecases/update_institution.dart'
    as _i83;
import '../features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i77;
import '../features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i84;
import 'register_module.dart' as _i85; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AddEditAddressCubit>(() =>
      _i3.AddEditAddressCubit(get<_i4.AddAddress>(), get<_i4.UpdateAddress>()));
  gh.lazySingleton<_i5.AddressSuggestionsApiService>(
      () => _i5.AddressSuggestionsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i7.AddressSuggestionsRepository>(() =>
      _i8.AddressSuggestionsRepositoryImpl(
          get<_i5.AddressSuggestionsApiService>()));
  gh.lazySingleton<_i9.AddressesLocalDataSource>(
      () => _i9.AddressesLocalDataSourceImpl());
  gh.lazySingleton<_i10.AddressesServiceApi>(() => _i10.AddressesServiceApiImpl(
      get<_i11.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.factory<_i12.CitiesSuggestionsBloc>(() => _i12.CitiesSuggestionsBloc(
      get<_i13.GetCitiesSuggestions>(), get<_i13.AddNewCity>()));
  gh.factory<_i14.Dio>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i15.DistributionAreaApiService>(
      () => _i15.DistributionAreaApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.factory<_i16.DistributionAreasBloc>(() => _i16.DistributionAreasBloc(
      get<_i13.GetGovernatesSuggestions>(),
      get<_i13.GetCitiesSuggestions>(),
      get<_i13.GetNeighborhoodsSuggestions>(),
      get<_i13.AddNewGovernate>(),
      get<_i13.AddNewCity>(),
      get<_i13.AddNewNeighborhood>(),
      get<_i17.GetDistributionAreas>(),
      get<_i17.AddDistributionArea>(),
      get<_i17.UpdateDistributionArea>(),
      get<_i17.DeleteDistributionArea>()));
  gh.lazySingleton<_i18.DistributionAreasRepository>(() =>
      _i19.DistributionAreasRepositoryImpl(
          get<_i15.DistributionAreaApiService>(), get<_i20.NetworkInfo>()));
  gh.lazySingleton<_i21.GetCitiesSuggestions>(
      () => _i21.GetCitiesSuggestions(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i22.GetDistributionAreas>(
      () => _i22.GetDistributionAreas(get<_i18.DistributionAreasRepository>()));
  gh.lazySingleton<_i23.GetGovernatesSuggestions>(() =>
      _i23.GetGovernatesSuggestions(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i24.GetNeighborhoodsSuggestions>(() =>
      _i24.GetNeighborhoodsSuggestions(
          get<_i7.AddressSuggestionsRepository>()));
  gh.factory<_i12.GovernatesSuggestionsBloc>(() =>
      _i12.GovernatesSuggestionsBloc(
          get<_i13.GetGovernatesSuggestions>(), get<_i13.AddNewGovernate>()));
  gh.factory<_i25.InstitutionCartCubit>(() => _i25.InstitutionCartCubit());
  gh.lazySingleton<_i26.InstitutionsApiService>(
      () => _i26.InstitutionsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i27.InstitutionsRepository>(() =>
      _i28.InstitutionsRepositoryImpl(
          get<_i26.InstitutionsApiService>(), get<_i20.NetworkInfo>()));
  gh.factory<_i29.ItemAddToCartDialogCubit>(
      () => _i29.ItemAddToCartDialogCubit());
  gh.lazySingleton<_i30.ItemsApiService>(() => _i30.ItemsApiServiceImpl(
      get<_i11.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i31.ItemsApiService2>(
      () => _i31.ItemsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i32.ItemsRepository>(() => _i33.ItemsRepositoryImpl(
      get<_i30.ItemsApiService>(), get<_i20.NetworkInfo>()));
  gh.lazySingleton<_i34.ItemsRepository>(() => _i35.ItemsRepositoryImpl(
      get<_i31.ItemsApiService2>(), get<_i36.NetworkInfo>()));
  gh.factory<_i37.ItemsWidgetCubit>(() => _i37.ItemsWidgetCubit());
  gh.lazySingleton<_i38.LocalDataSource>(
      () => _i38.LocalDataSourceImpl(get<_i39.SharedPreferences>()));
  gh.factory<_i12.NeighborhoodsSuggestionsBloc>(() =>
      _i12.NeighborhoodsSuggestionsBloc(get<_i13.GetNeighborhoodsSuggestions>(),
          get<_i13.AddNewNeighborhood>()));
  gh.lazySingleton<_i40.SearchItem>(
      () => _i40.SearchItem(get<_i32.ItemsRepository>()));
  gh.lazySingleton<_i41.StartUpRepository>(
      () => _i42.StartUpRepositoryImpl(get<_i38.LocalDataSource>()));
  gh.lazySingleton<_i43.UpdateDistributionArea>(() =>
      _i43.UpdateDistributionArea(get<_i18.DistributionAreasRepository>()));
  gh.lazySingleton<_i44.UpdateInstitutionItem>(
      () => _i44.UpdateInstitutionItem(get<_i32.ItemsRepository>()));
  gh.lazySingleton<_i45.UserInstitutionsServiceApi>(() =>
      _i45.UserInstitutionsServiceApiImpl(
          get<_i11.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i46.AddDistributionArea>(
      () => _i46.AddDistributionArea(get<_i18.DistributionAreasRepository>()));
  gh.lazySingleton<_i47.AddInstitutionItem>(
      () => _i47.AddInstitutionItem(get<_i32.ItemsRepository>()));
  gh.lazySingleton<_i48.AddNewCity>(
      () => _i48.AddNewCity(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i49.AddNewGovernate>(
      () => _i49.AddNewGovernate(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i50.AddNewNeighborhood>(
      () => _i50.AddNewNeighborhood(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i51.AddRefAndInstitutionItem>(
      () => _i51.AddRefAndInstitutionItem(get<_i32.ItemsRepository>()));
  gh.factory<_i52.AddressSuggestionsBloc>(() => _i52.AddressSuggestionsBloc(
      get<_i23.GetGovernatesSuggestions>(),
      get<_i21.GetCitiesSuggestions>(),
      get<_i24.GetNeighborhoodsSuggestions>(),
      get<_i49.AddNewGovernate>(),
      get<_i48.AddNewCity>(),
      get<_i50.AddNewNeighborhood>()));
  gh.lazySingleton<_i53.AddressesRepository>(() => _i54.AddressesRepositoryImpl(
      get<_i10.AddressesServiceApi>(),
      get<_i20.NetworkInfo>(),
      get<_i9.AddressesLocalDataSource>()));
  gh.lazySingleton<_i55.CheckIfSeenBefore>(
      () => _i55.CheckIfSeenBefore(get<_i41.StartUpRepository>()));
  gh.lazySingleton<_i56.CurrencyApiService>(
      () => _i56.CurrencyApiService(get<_i14.Dio>()));
  gh.lazySingleton<_i57.CurrencyRepository>(() => _i58.CurrencyRepositoryImpl(
      get<_i56.CurrencyApiService>(), get<_i20.NetworkInfo>()));
  gh.lazySingleton<_i59.DeleteDistributionArea>(() =>
      _i59.DeleteDistributionArea(get<_i18.DistributionAreasRepository>()));
  gh.lazySingleton<_i60.GetAddresses>(
      () => _i60.GetAddresses(get<_i53.AddressesRepository>()));
  gh.lazySingleton<_i61.GetCurrentLocation>(
      () => _i61.GetCurrentLocation(get<_i53.AddressesRepository>()));
  gh.lazySingleton<_i62.GetInstitutionItems>(
      () => _i62.GetInstitutionItems(get<_i32.ItemsRepository>()));
  gh.lazySingleton<_i63.GetInstitutions>(
      () => _i63.GetInstitutions(get<_i27.InstitutionsRepository>()));
  gh.lazySingleton<_i64.GetItems>(
      () => _i64.GetItems(get<_i34.ItemsRepository>()));
  gh.factory<_i65.InstitutionItemsCubit>(
      () => _i65.InstitutionItemsCubit(get<_i62.GetInstitutionItems>()));
  gh.factory<_i66.InstitutionsCubit>(
      () => _i66.InstitutionsCubit(get<_i63.GetInstitutions>()));
  gh.factory<_i67.ItemsCubit>(() => _i67.ItemsCubit(get<_i64.GetItems>()));
  gh.factory<_i68.LocationWidgetCubit>(
      () => _i68.LocationWidgetCubit(get<_i61.GetCurrentLocation>()));
  gh.lazySingleton<_i69.RemoveAddress>(
      () => _i69.RemoveAddress(get<_i53.AddressesRepository>()));
  gh.factory<_i70.SelectLocationMapBloc>(
      () => _i70.SelectLocationMapBloc(get<_i61.GetCurrentLocation>()));
  gh.factory<_i71.StartUpCubit>(
      () => _i71.StartUpCubit(get<_i55.CheckIfSeenBefore>()));
  gh.lazySingleton<_i72.UpdateAddress>(
      () => _i72.UpdateAddress(get<_i53.AddressesRepository>()));
  gh.lazySingleton<_i73.UserInstitutionsRepository>(() =>
      _i74.UserInstitutionsRepositoryImpl(
          get<_i45.UserInstitutionsServiceApi>(), get<_i36.NetworkInfo>()));
  gh.lazySingleton<_i75.AddAddress>(
      () => _i75.AddAddress(get<_i53.AddressesRepository>()));
  gh.lazySingleton<_i76.AddInstitution>(
      () => _i76.AddInstitution(get<_i73.UserInstitutionsRepository>()));
  gh.factory<_i77.AddInstitutionCubit>(
      () => _i77.AddInstitutionCubit(get<_i76.AddInstitution>()));
  gh.factory<_i78.AddItemBloc>(() => _i78.AddItemBloc(
      get<_i40.SearchItem>(),
      get<_i47.AddInstitutionItem>(),
      get<_i51.AddRefAndInstitutionItem>(),
      get<_i44.UpdateInstitutionItem>()));
  gh.factory<_i79.AddressesCubit>(
      () => _i79.AddressesCubit(get<_i60.GetAddresses>()));
  gh.lazySingleton<_i80.ConvertCurrencyUseCase>(
      () => _i80.ConvertCurrencyUseCase(get<_i57.CurrencyRepository>()));
  gh.factory<_i81.CurrencyCubit>(
      () => _i81.CurrencyCubit(get<_i80.ConvertCurrencyUseCase>()));
  gh.lazySingleton<_i82.GetUserInstitutions>(
      () => _i82.GetUserInstitutions(get<_i73.UserInstitutionsRepository>()));
  gh.lazySingleton<_i83.UpdateInstitution>(
      () => _i83.UpdateInstitution(get<_i73.UserInstitutionsRepository>()));
  gh.factory<_i84.UserInstitutionsCubit>(
      () => _i84.UserInstitutionsCubit(get<_i82.GetUserInstitutions>()));
  return get;
}

class _$RegisterModule extends _i85.RegisterModule {}
