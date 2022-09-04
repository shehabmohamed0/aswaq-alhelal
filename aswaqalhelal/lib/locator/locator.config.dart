// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i16;
import 'package:cloud_functions/cloud_functions.dart' as _i17;
import 'package:firebase_auth/firebase_auth.dart' as _i13;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/cache_client.dart' as _i19;
import 'package:root_package/core/services/network_info.dart' as _i30;
import 'package:root_package/packages/cloud_firestore.dart' as _i6;
import 'package:root_package/packages/firebase_auth.dart' as _i11;
import 'package:root_package/packages/flutter_facebook_auth.dart' as _i31;
import 'package:root_package/packages/google_sign_in.dart' as _i36;
import 'package:root_package/packages/shared_preferences.dart' as _i55;
import 'package:root_package/root_package.dart' as _i22;
import 'package:sms_autofill/sms_autofill.dart' as _i68;

import '../features/address/data/datasources/address_local_data_source.dart'
    as _i9;
import '../features/address/data/datasources/addresses_service_api.dart'
    as _i10;
import '../features/address/data/repositories/addresses_repository_impl.dart'
    as _i95;
import '../features/address/domain/repositories/addresses_repository.dart'
    as _i94;
import '../features/address/domain/usecases/add_address.dart' as _i119;
import '../features/address/domain/usecases/add_first_address.dart' as _i120;
import '../features/address/domain/usecases/get_addresses.dart' as _i100;
import '../features/address/domain/usecases/get_current_location.dart' as _i101;
import '../features/address/domain/usecases/remove_address.dart' as _i112;
import '../features/address/domain/usecases/update_address.dart' as _i115;
import '../features/address/domain/usecases/usecases.dart' as _i4;
import '../features/address/presentation/bloc/select_location_map/select_location_map_bloc.dart'
    as _i113;
import '../features/address/presentation/cubit/add_edit_address/add_edit_address_cubit.dart'
    as _i3;
import '../features/address/presentation/cubit/add_first_address/add_first_address_cubit.dart'
    as _i121;
import '../features/address/presentation/cubit/addresses/addresses_cubit.dart'
    as _i126;
import '../features/address_suggestions/data/datasources/address_suggestions_api_service.dart'
    as _i5;
import '../features/address_suggestions/data/repositories/address_suggestions_repository_impl.dart'
    as _i8;
import '../features/address_suggestions/domain/repositories/address_suggestions_repository.dart'
    as _i7;
import '../features/address_suggestions/domain/usecases/add_new_city.dart'
    as _i88;
import '../features/address_suggestions/domain/usecases/add_new_governate.dart'
    as _i89;
import '../features/address_suggestions/domain/usecases/add_new_neighborhood.dart'
    as _i90;
import '../features/address_suggestions/domain/usecases/get_cities_suggetsions.dart'
    as _i32;
import '../features/address_suggestions/domain/usecases/get_districts_suggestions.dart'
    as _i35;
import '../features/address_suggestions/domain/usecases/get_governates_suggestions.dart'
    as _i34;
import '../features/address_suggestions/domain/usecases/usecases.dart' as _i24;
import '../features/address_suggestions/presentation/bloc/address_suggestions2_bloc.dart'
    as _i23;
import '../features/address_suggestions/presentation/bloc/address_suggestions_bloc.dart'
    as _i93;
import '../features/address_suggestions/presentation/cubit/location_widget/location_widget_cubit.dart'
    as _i111;
import '../features/auth/data/datasources/local/auth_local_service.dart'
    as _i18;
import '../features/auth/data/datasources/remote/auth_api_service.dart' as _i12;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i21;
import '../features/auth/domain/repositories/auth_repository.dart' as _i20;
import '../features/auth/domain/usecases/is_phone_exists_usecase.dart' as _i44;
import '../features/auth/domain/usecases/link_email_and_password.dart' as _i53;
import '../features/auth/domain/usecases/log_out.dart' as _i56;
import '../features/auth/domain/usecases/phone_sign_up.dart' as _i59;
import '../features/auth/domain/usecases/sign_in_with_email_and_password.dart'
    as _i64;
import '../features/auth/domain/usecases/sign_in_with_facebook.dart' as _i65;
import '../features/auth/domain/usecases/sign_in_with_google.dart' as _i66;
import '../features/auth/domain/usecases/sign_in_with_phone.dart' as _i67;
import '../features/auth/domain/usecases/usecases.dart' as _i58;
import '../features/auth/domain/usecases/verify_phone_number.dart' as _i82;
import '../features/auth/presentation/bloc/app_status/app_bloc.dart' as _i96;
import '../features/auth/presentation/bloc/sign_in/phone_sign_in_form_cubit.dart'
    as _i57;
import '../features/distribution_areas/data/datasources/distribution_area_api_service.dart'
    as _i25;
import '../features/distribution_areas/data/repositories/distribution_areas_repository_impl.dart'
    as _i29;
import '../features/distribution_areas/domain/repositories/distribution_area_repository.dart'
    as _i28;
import '../features/distribution_areas/domain/usecases/add_distribution_area.dart'
    as _i84;
import '../features/distribution_areas/domain/usecases/delete_distribution_area.dart'
    as _i98;
import '../features/distribution_areas/domain/usecases/get_distribution_areas.dart'
    as _i33;
import '../features/distribution_areas/domain/usecases/update_distribution_area.dart'
    as _i74;
import '../features/distribution_areas/domain/usecases/usecases.dart' as _i27;
import '../features/distribution_areas/presentation/bloc/distribution_areas_bloc.dart'
    as _i26;
import '../features/home/data/datasources/items_api_servic.dart' as _i47;
import '../features/home/data/repositories/items_repository_impl.dart' as _i49;
import '../features/home/domain/repositories/items_repository.dart' as _i48;
import '../features/home/domain/usecases/get_items.dart' as _i104;
import '../features/home/presentation/cubit/items/items_cubit.dart' as _i109;
import '../features/home/presentation/cubit/items_widget/items_widget_cubit.dart'
    as _i52;
import '../features/institution_receipts/data/datasources/institution_receipts_api_service.dart'
    as _i38;
import '../features/institution_receipts/data/repositories/institution_receipts_repository_impl.dart'
    as _i40;
import '../features/institution_receipts/domain/repositories/institution_receipts_repository.dart'
    as _i39;
import '../features/institution_receipts/domain/usecases/add_institution_receipts.dart'
    as _i87;
import '../features/institution_receipts/domain/usecases/get_institution_receipts.dart'
    as _i103;
import '../features/institution_receipts/presentation/cubit/institution_receipts_cubit.dart'
    as _i107;
import '../features/institutions/data/datasources/institutions_api_service.dart'
    as _i41;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i43;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i42;
import '../features/institutions/domain/usecases/get_institutions.dart' as _i99;
import '../features/institutions/presentation/cubit/institutions_cubit.dart'
    as _i108;
import '../features/instutution_items/data/datasources/items_api_service.dart'
    as _i46;
import '../features/instutution_items/data/datasources/units_api_service.dart'
    as _i71;
import '../features/instutution_items/data/repositories/items_repository_impl.dart'
    as _i51;
import '../features/instutution_items/data/repositories/units_repository_impl.dart'
    as _i73;
import '../features/instutution_items/domain/repositories/items_repository.dart'
    as _i50;
import '../features/instutution_items/domain/repositories/units_repository.dart'
    as _i72;
import '../features/instutution_items/domain/usecases/add_instition_item.dart'
    as _i86;
import '../features/instutution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i91;
import '../features/instutution_items/domain/usecases/add_unit_to_reference.dart'
    as _i92;
import '../features/instutution_items/domain/usecases/get_institution_items.dart'
    as _i102;
import '../features/instutution_items/domain/usecases/get_unit_suggestions.dart'
    as _i105;
import '../features/instutution_items/domain/usecases/search_item.dart' as _i63;
import '../features/instutution_items/domain/usecases/update_institution_item.dart'
    as _i77;
import '../features/instutution_items/presentation/bloc/add_item/add_item_bloc.dart'
    as _i124;
import '../features/instutution_items/presentation/bloc/add_unit/add_unit_bloc.dart'
    as _i125;
import '../features/instutution_items/presentation/cubit/institution_cart/institution_cart_cubit.dart'
    as _i37;
import '../features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart'
    as _i106;
import '../features/instutution_items/presentation/cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart'
    as _i45;
import '../features/settings/data/datasources/profile_api_service.dart' as _i60;
import '../features/settings/data/repositories/profile_repository_impl.dart'
    as _i62;
import '../features/settings/domain/repositories/profile_repository.dart'
    as _i61;
import '../features/settings/domain/usecases/update_email.dart' as _i75;
import '../features/settings/domain/usecases/update_phone_number.dart' as _i78;
import '../features/settings/domain/usecases/update_profile.dart' as _i80;
import '../features/settings/presentation/bloc/account_info/account_info_cubit.dart'
    as _i83;
import '../features/settings/presentation/bloc/add_email/add_email_cubit.dart'
    as _i110;
import '../features/settings/presentation/bloc/add_email/add_email_verification_cubit.dart'
    as _i85;
import '../features/settings/presentation/bloc/change_phone/update_phone_cubit.dart'
    as _i116;
import '../features/settings/presentation/bloc/change_phone/update_phone_verification_cubit.dart'
    as _i79;
import '../features/settings/presentation/bloc/cubit/update_email_cubit.dart'
    as _i76;
import '../features/start_up/data/datasources/local_data_source.dart' as _i54;
import '../features/start_up/data/repositories/start_up_repository_impl.dart'
    as _i70;
import '../features/start_up/domain/repositories/start_up_repository.dart'
    as _i69;
import '../features/start_up/domain/usecases/check_if_seen_before.dart' as _i97;
import '../features/start_up/presentation/cubit/cubit/start_up_cubit.dart'
    as _i114;
import '../features/user_institutions/data/datasources/user_institutions_service_api.dart'
    as _i81;
import '../features/user_institutions/data/repositories/institutions_repository_impl.dart'
    as _i118;
import '../features/user_institutions/domain/repositories/institutions_repository.dart'
    as _i117;
import '../features/user_institutions/domain/usecases/add_institution.dart'
    as _i122;
import '../features/user_institutions/domain/usecases/get_user_institutions.dart'
    as _i127;
import '../features/user_institutions/domain/usecases/update_institution.dart'
    as _i128;
import '../features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i123;
import '../features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i129;
import 'register_module.dart' as _i130; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i12.AuthApiService>(() => _i12.AuthApiServiceImpl(
      firebaseAuth: get<_i13.FirebaseAuth>(),
      googleSignIn: get<_i14.GoogleSignIn>(),
      facebookAuth: get<_i15.FacebookAuth>(),
      firestore: get<_i16.FirebaseFirestore>(),
      cloudFunctions: get<_i17.FirebaseFunctions>()));
  gh.lazySingleton<_i18.AuthLocalService>(
      () => _i18.AuthLocalServiceImpl(get<_i19.CacheClient>()));
  gh.lazySingleton<_i20.AuthRepository>(() => _i21.AuthRepositoryImpl(
      authApiService: get<_i12.AuthApiService>(),
      authLocalService: get<_i18.AuthLocalService>(),
      networkInfo: get<_i22.NetworkInfo>()));
  gh.factory<_i23.CitiesSuggestionsBloc>(() => _i23.CitiesSuggestionsBloc(
      get<_i24.GetCitiesSuggestions>(), get<_i24.AddNewCity>()));
  gh.lazySingleton<_i25.DistributionAreaApiService>(
      () => _i25.DistributionAreaApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.factory<_i26.DistributionAreasBloc>(() => _i26.DistributionAreasBloc(
      get<_i24.GetGovernatesSuggestions>(),
      get<_i24.GetCitiesSuggestions>(),
      get<_i24.GetNeighborhoodsSuggestions>(),
      get<_i24.AddNewGovernate>(),
      get<_i24.AddNewCity>(),
      get<_i24.AddNewNeighborhood>(),
      get<_i27.GetDistributionAreas>(),
      get<_i27.AddDistributionArea>(),
      get<_i27.UpdateDistributionArea>(),
      get<_i27.DeleteDistributionArea>()));
  gh.lazySingleton<_i28.DistributionAreasRepository>(() =>
      _i29.DistributionAreasRepositoryImpl(
          get<_i25.DistributionAreaApiService>(), get<_i30.NetworkInfo>()));
  gh.factory<_i31.FacebookAuth>(() => registerModule.facebookAuth);
  gh.lazySingleton<_i32.GetCitiesSuggestions>(
      () => _i32.GetCitiesSuggestions(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i33.GetDistributionAreas>(
      () => _i33.GetDistributionAreas(get<_i28.DistributionAreasRepository>()));
  gh.lazySingleton<_i34.GetGovernatesSuggestions>(() =>
      _i34.GetGovernatesSuggestions(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i35.GetNeighborhoodsSuggestions>(() =>
      _i35.GetNeighborhoodsSuggestions(
          get<_i7.AddressSuggestionsRepository>()));
  gh.factory<_i36.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i23.GovernatesSuggestionsBloc>(() =>
      _i23.GovernatesSuggestionsBloc(
          get<_i24.GetGovernatesSuggestions>(), get<_i24.AddNewGovernate>()));
  gh.factory<_i37.InstitutionCartCubit>(() => _i37.InstitutionCartCubit());
  gh.lazySingleton<_i38.InstitutionReceiptsApiService>(() =>
      _i38.InstitutionReceiptsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i39.InstitutionReceiptsRepository>(() =>
      _i40.InstitutionReceiptsRepositoryImpl(
          get<_i38.InstitutionReceiptsApiService>(), get<_i30.NetworkInfo>()));
  gh.lazySingleton<_i41.InstitutionsApiService>(
      () => _i41.InstitutionsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i42.InstitutionsRepository>(() =>
      _i43.InstitutionsRepositoryImpl(
          get<_i41.InstitutionsApiService>(), get<_i22.NetworkInfo>()));
  gh.factory<_i44.IsPhoneExistsUsecase>(
      () => _i44.IsPhoneExistsUsecase(get<_i20.AuthRepository>()));
  gh.factory<_i45.ItemAddToCartDialogCubit>(
      () => _i45.ItemAddToCartDialogCubit());
  gh.lazySingleton<_i46.ItemsApiService>(() => _i46.ItemsApiServiceImpl(
      get<_i11.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i47.ItemsApiService2>(
      () => _i47.ItemsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i48.ItemsRepository>(() => _i49.ItemsRepositoryImpl(
      get<_i47.ItemsApiService2>(), get<_i22.NetworkInfo>()));
  gh.lazySingleton<_i50.ItemsRepository>(() => _i51.ItemsRepositoryImpl(
      get<_i46.ItemsApiService>(), get<_i30.NetworkInfo>()));
  gh.factory<_i52.ItemsWidgetCubit>(() => _i52.ItemsWidgetCubit());
  gh.lazySingleton<_i53.LinkEmailAndPassword>(
      () => _i53.LinkEmailAndPassword(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i54.LocalDataSource>(
      () => _i54.LocalDataSourceImpl(get<_i55.SharedPreferences>()));
  gh.lazySingleton<_i56.LogOut>(() => _i56.LogOut(get<_i20.AuthRepository>()));
  gh.factory<_i23.NeighborhoodsSuggestionsBloc>(() =>
      _i23.NeighborhoodsSuggestionsBloc(get<_i24.GetNeighborhoodsSuggestions>(),
          get<_i24.AddNewNeighborhood>()));
  gh.factory<_i57.PhoneSignInFormCubit>(() => _i57.PhoneSignInFormCubit(
      get<_i58.VerifyPhoneNumber>(), get<_i58.SignInWithPhone>()));
  gh.lazySingleton<_i59.PhoneSignUp>(
      () => _i59.PhoneSignUp(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i60.ProfileApiService>(() => _i60.ProfileApiServiceImpl(
      get<_i13.FirebaseAuth>(), get<_i16.FirebaseFirestore>()));
  gh.lazySingleton<_i61.ProfileRepository>(() => _i62.ProfileRepositoryImpl(
      get<_i60.ProfileApiService>(), get<_i30.NetworkInfo>()));
  gh.lazySingleton<_i63.SearchItem>(
      () => _i63.SearchItem(get<_i50.ItemsRepository>()));
  gh.lazySingleton<_i64.SignInWithEmailAndPassword>(
      () => _i64.SignInWithEmailAndPassword(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i65.SignInWithFacebook>(
      () => _i65.SignInWithFacebook(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i66.SignInWithGoogle>(
      () => _i66.SignInWithGoogle(get<_i20.AuthRepository>()));
  gh.lazySingleton<_i67.SignInWithPhone>(
      () => _i67.SignInWithPhone(get<_i20.AuthRepository>()));
  gh.factory<_i68.SmsAutoFill>(() => registerModule.smsAutoFill);
  gh.lazySingleton<_i69.StartUpRepository>(
      () => _i70.StartUpRepositoryImpl(get<_i54.LocalDataSource>()));
  gh.lazySingleton<_i71.UnitsApiService>(
      () => _i71.UnitsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i72.UnitsRepository>(() => _i73.UnitsRepositoryImpl(
      get<_i30.NetworkInfo>(), get<_i71.UnitsApiService>()));
  gh.lazySingleton<_i74.UpdateDistributionArea>(() =>
      _i74.UpdateDistributionArea(get<_i28.DistributionAreasRepository>()));
  gh.lazySingleton<_i75.UpdateEmail>(
      () => _i75.UpdateEmail(get<_i61.ProfileRepository>()));
  gh.factory<_i76.UpdateEmailCubit>(
      () => _i76.UpdateEmailCubit(get<_i75.UpdateEmail>()));
  gh.lazySingleton<_i77.UpdateInstitutionItem>(
      () => _i77.UpdateInstitutionItem(get<_i50.ItemsRepository>()));
  gh.lazySingleton<_i78.UpdatePhoneNumber>(
      () => _i78.UpdatePhoneNumber(get<_i61.ProfileRepository>()));
  gh.factory<_i79.UpdatePhoneVerificationCubit>(() =>
      _i79.UpdatePhoneVerificationCubit(
          get<_i78.UpdatePhoneNumber>(), get<_i68.SmsAutoFill>()));
  gh.lazySingleton<_i80.UpdateProfile>(
      () => _i80.UpdateProfile(get<_i61.ProfileRepository>()));
  gh.lazySingleton<_i81.UserInstitutionsServiceApi>(() =>
      _i81.UserInstitutionsServiceApiImpl(
          get<_i11.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i82.VerifyPhoneNumber>(
      () => _i82.VerifyPhoneNumber(get<_i20.AuthRepository>()));
  gh.factory<_i83.AccountInfoCubit>(
      () => _i83.AccountInfoCubit(get<_i80.UpdateProfile>()));
  gh.lazySingleton<_i84.AddDistributionArea>(
      () => _i84.AddDistributionArea(get<_i28.DistributionAreasRepository>()));
  gh.factory<_i85.AddEmailVerificationCubit>(() =>
      _i85.AddEmailVerificationCubit(
          get<_i53.LinkEmailAndPassword>(), get<_i68.SmsAutoFill>()));
  gh.lazySingleton<_i86.AddInstitutionItem>(
      () => _i86.AddInstitutionItem(get<_i50.ItemsRepository>()));
  gh.lazySingleton<_i87.AddInstitutionReceipt>(() =>
      _i87.AddInstitutionReceipt(get<_i39.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i88.AddNewCity>(
      () => _i88.AddNewCity(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i89.AddNewGovernate>(
      () => _i89.AddNewGovernate(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i90.AddNewNeighborhood>(
      () => _i90.AddNewNeighborhood(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i91.AddRefAndInstitutionItem>(
      () => _i91.AddRefAndInstitutionItem(get<_i50.ItemsRepository>()));
  gh.lazySingleton<_i92.AddUnitToReference>(
      () => _i92.AddUnitToReference(get<_i72.UnitsRepository>()));
  gh.factory<_i93.AddressSuggestionsBloc>(() => _i93.AddressSuggestionsBloc(
      get<_i34.GetGovernatesSuggestions>(),
      get<_i32.GetCitiesSuggestions>(),
      get<_i35.GetNeighborhoodsSuggestions>(),
      get<_i89.AddNewGovernate>(),
      get<_i88.AddNewCity>(),
      get<_i90.AddNewNeighborhood>()));
  gh.lazySingleton<_i94.AddressesRepository>(() => _i95.AddressesRepositoryImpl(
      get<_i10.AddressesServiceApi>(),
      get<_i30.NetworkInfo>(),
      get<_i9.AddressesLocalDataSource>()));
  gh.factory<_i96.AppBloc>(
      () => _i96.AppBloc(authRepository: get<_i20.AuthRepository>()));
  gh.lazySingleton<_i97.CheckIfSeenBefore>(
      () => _i97.CheckIfSeenBefore(get<_i69.StartUpRepository>()));
  gh.lazySingleton<_i98.DeleteDistributionArea>(() =>
      _i98.DeleteDistributionArea(get<_i28.DistributionAreasRepository>()));
  gh.lazySingleton<_i99.GetAddressInstitutions>(
      () => _i99.GetAddressInstitutions(get<_i42.InstitutionsRepository>()));
  gh.lazySingleton<_i100.GetAddresses>(
      () => _i100.GetAddresses(get<_i94.AddressesRepository>()));
  gh.lazySingleton<_i101.GetCurrentLocation>(
      () => _i101.GetCurrentLocation(get<_i94.AddressesRepository>()));
  gh.lazySingleton<_i102.GetInstitutionItems>(
      () => _i102.GetInstitutionItems(get<_i50.ItemsRepository>()));
  gh.lazySingleton<_i103.GetInstitutionReceipts>(() =>
      _i103.GetInstitutionReceipts(get<_i39.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i104.GetItems>(
      () => _i104.GetItems(get<_i48.ItemsRepository>()));
  gh.lazySingleton<_i105.GetUnitSuggestions>(
      () => _i105.GetUnitSuggestions(get<_i72.UnitsRepository>()));
  gh.factory<_i106.InstitutionItemsCubit>(
      () => _i106.InstitutionItemsCubit(get<_i102.GetInstitutionItems>()));
  gh.factory<_i107.InstitutionReceiptsCubit>(() =>
      _i107.InstitutionReceiptsCubit(
          get<_i102.GetInstitutionItems>(),
          get<_i103.GetInstitutionReceipts>(),
          get<_i87.AddInstitutionReceipt>()));
  gh.factory<_i108.InstitutionsCubit>(
      () => _i108.InstitutionsCubit(get<_i99.GetAddressInstitutions>()));
  gh.factory<_i109.ItemsCubit>(() => _i109.ItemsCubit(get<_i104.GetItems>()));
  gh.factory<_i110.LinkEmailAndPasswordCubit>(
      () => _i110.LinkEmailAndPasswordCubit(get<_i82.VerifyPhoneNumber>()));
  gh.factory<_i111.LocationWidgetCubit>(
      () => _i111.LocationWidgetCubit(get<_i101.GetCurrentLocation>()));
  gh.lazySingleton<_i112.RemoveAddress>(
      () => _i112.RemoveAddress(get<_i94.AddressesRepository>()));
  gh.factory<_i113.SelectLocationMapBloc>(
      () => _i113.SelectLocationMapBloc(get<_i101.GetCurrentLocation>()));
  gh.factory<_i114.StartUpCubit>(
      () => _i114.StartUpCubit(get<_i97.CheckIfSeenBefore>()));
  gh.lazySingleton<_i115.UpdateAddress>(
      () => _i115.UpdateAddress(get<_i94.AddressesRepository>()));
  gh.factory<_i116.UpdatePhoneCubit>(
      () => _i116.UpdatePhoneCubit(get<_i82.VerifyPhoneNumber>()));
  gh.lazySingleton<_i117.UserInstitutionsRepository>(() =>
      _i118.UserInstitutionsRepositoryImpl(
          get<_i81.UserInstitutionsServiceApi>(), get<_i22.NetworkInfo>()));
  gh.lazySingleton<_i119.AddAddress>(
      () => _i119.AddAddress(get<_i94.AddressesRepository>()));
  gh.lazySingleton<_i120.AddFirstAddress>(
      () => _i120.AddFirstAddress(get<_i94.AddressesRepository>()));
  gh.lazySingleton<_i121.AddFirstAddressCubit>(
      () => _i121.AddFirstAddressCubit(get<_i120.AddFirstAddress>()));
  gh.lazySingleton<_i122.AddInstitution>(
      () => _i122.AddInstitution(get<_i117.UserInstitutionsRepository>()));
  gh.factory<_i123.AddInstitutionCubit>(
      () => _i123.AddInstitutionCubit(get<_i122.AddInstitution>()));
  gh.factory<_i124.AddItemBloc>(() => _i124.AddItemBloc(
      get<_i63.SearchItem>(),
      get<_i86.AddInstitutionItem>(),
      get<_i91.AddRefAndInstitutionItem>(),
      get<_i77.UpdateInstitutionItem>()));
  gh.factory<_i125.AddUnitBloc>(() => _i125.AddUnitBloc(
      get<_i105.GetUnitSuggestions>(), get<_i92.AddUnitToReference>()));
  gh.factory<_i126.AddressesCubit>(
      () => _i126.AddressesCubit(get<_i100.GetAddresses>()));
  gh.lazySingleton<_i127.GetUserInstitutions>(
      () => _i127.GetUserInstitutions(get<_i117.UserInstitutionsRepository>()));
  gh.lazySingleton<_i128.UpdateInstitution>(
      () => _i128.UpdateInstitution(get<_i117.UserInstitutionsRepository>()));
  gh.factory<_i129.UserInstitutionsCubit>(
      () => _i129.UserInstitutionsCubit(get<_i127.GetUserInstitutions>()));
  return get;
}

class _$RegisterModule extends _i130.RegisterModule {}
