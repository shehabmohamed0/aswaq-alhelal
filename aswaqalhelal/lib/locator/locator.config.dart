// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i54;
import 'package:cloud_functions/cloud_functions.dart' as _i96;
import 'package:firebase_auth/firebase_auth.dart' as _i53;
import 'package:firebase_messaging/firebase_messaging.dart' as _i23;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i95;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i94;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/cache_client.dart' as _i13;
import 'package:root_package/core/services/network_info.dart' as _i21;
import 'package:root_package/packages/cloud_firestore.dart' as _i6;
import 'package:root_package/packages/cloud_functions.dart' as _i58;
import 'package:root_package/packages/firebase_auth.dart' as _i11;
import 'package:root_package/packages/flutter_facebook_auth.dart' as _i22;
import 'package:root_package/packages/google_sign_in.dart' as _i28;
import 'package:root_package/packages/shared_preferences.dart' as _i49;
import 'package:root_package/root_package.dart' as _i36;
import 'package:sms_autofill/sms_autofill.dart' as _i66;

import '../features/address/data/datasources/address_local_data_source.dart'
    as _i9;
import '../features/address/data/datasources/addresses_service_api.dart'
    as _i10;
import '../features/address/data/repositories/addresses_repository_impl.dart'
    as _i92;
import '../features/address/domain/repositories/addresses_repository.dart'
    as _i91;
import '../features/address/domain/usecases/add_address.dart' as _i135;
import '../features/address/domain/usecases/add_first_address.dart' as _i137;
import '../features/address/domain/usecases/get_addresses.dart' as _i103;
import '../features/address/domain/usecases/get_current_location.dart' as _i104;
import '../features/address/domain/usecases/remove_address.dart' as _i124;
import '../features/address/domain/usecases/update_address.dart' as _i131;
import '../features/address/domain/usecases/usecases.dart' as _i4;
import '../features/address/presentation/bloc/select_location_map/select_location_map_bloc.dart'
    as _i125;
import '../features/address/presentation/cubit/add_edit_address/add_edit_address_cubit.dart'
    as _i3;
import '../features/address/presentation/cubit/add_first_address/add_first_address_cubit.dart'
    as _i138;
import '../features/address/presentation/cubit/addresses/addresses_cubit.dart'
    as _i143;
import '../features/address_suggestions/data/datasources/address_suggestions_api_service.dart'
    as _i5;
import '../features/address_suggestions/data/repositories/address_suggestions_repository_impl.dart'
    as _i8;
import '../features/address_suggestions/domain/repositories/address_suggestions_repository.dart'
    as _i7;
import '../features/address_suggestions/domain/usecases/add_new_city.dart'
    as _i85;
import '../features/address_suggestions/domain/usecases/add_new_governate.dart'
    as _i86;
import '../features/address_suggestions/domain/usecases/add_new_neighborhood.dart'
    as _i87;
import '../features/address_suggestions/domain/usecases/get_cities_suggetsions.dart'
    as _i24;
import '../features/address_suggestions/domain/usecases/get_districts_suggestions.dart'
    as _i27;
import '../features/address_suggestions/domain/usecases/get_governates_suggestions.dart'
    as _i26;
import '../features/address_suggestions/domain/usecases/usecases.dart' as _i15;
import '../features/address_suggestions/presentation/bloc/address_suggestions2_bloc.dart'
    as _i14;
import '../features/address_suggestions/presentation/bloc/address_suggestions_bloc.dart'
    as _i90;
import '../features/address_suggestions/presentation/cubit/location_widget/location_widget_cubit.dart'
    as _i120;
import '../features/auth/data/datasources/local/auth_local_service.dart'
    as _i12;
import '../features/auth/data/datasources/remote/auth_api_service.dart' as _i93;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i98;
import '../features/auth/domain/repositories/auth_repository.dart' as _i97;
import '../features/auth/domain/usecases/is_phone_exists_usecase.dart' as _i116;
import '../features/auth/domain/usecases/link_email_and_password.dart' as _i119;
import '../features/auth/domain/usecases/log_out.dart' as _i121;
import '../features/auth/domain/usecases/phone_sign_up.dart' as _i122;
import '../features/auth/domain/usecases/sign_in_with_email_and_password.dart'
    as _i126;
import '../features/auth/domain/usecases/sign_in_with_facebook.dart' as _i127;
import '../features/auth/domain/usecases/sign_in_with_google.dart' as _i128;
import '../features/auth/domain/usecases/sign_in_with_phone.dart' as _i129;
import '../features/auth/domain/usecases/usecases.dart' as _i51;
import '../features/auth/domain/usecases/verify_phone_number.dart' as _i134;
import '../features/auth/presentation/bloc/app_status/app_bloc.dart' as _i144;
import '../features/auth/presentation/bloc/sign_in/phone_sign_in_form_cubit.dart'
    as _i50;
import '../features/distribution_areas/data/datasources/distribution_area_api_service.dart'
    as _i16;
import '../features/distribution_areas/data/repositories/distribution_areas_repository_impl.dart'
    as _i20;
import '../features/distribution_areas/domain/repositories/distribution_area_repository.dart'
    as _i19;
import '../features/distribution_areas/domain/usecases/add_distribution_area.dart'
    as _i82;
import '../features/distribution_areas/domain/usecases/delete_distribution_area.dart'
    as _i101;
import '../features/distribution_areas/domain/usecases/get_distribution_areas.dart'
    as _i25;
import '../features/distribution_areas/domain/usecases/update_distribution_area.dart'
    as _i72;
import '../features/distribution_areas/domain/usecases/usecases.dart' as _i18;
import '../features/distribution_areas/presentation/bloc/distribution_areas_bloc.dart'
    as _i17;
import '../features/home/data/datasources/items_api_servic.dart' as _i39;
import '../features/home/data/repositories/items_repository_impl.dart' as _i43;
import '../features/home/domain/repositories/items_repository.dart' as _i42;
import '../features/home/domain/usecases/get_items.dart' as _i108;
import '../features/home/presentation/cubit/items/items_cubit.dart' as _i117;
import '../features/home/presentation/cubit/items_widget/items_widget_cubit.dart'
    as _i44;
import '../features/institution_receipts/data/datasources/institution_receipts_api_service.dart'
    as _i30;
import '../features/institution_receipts/data/repositories/institution_receipts_repository_impl.dart'
    as _i32;
import '../features/institution_receipts/domain/repositories/institution_receipts_repository.dart'
    as _i31;
import '../features/institution_receipts/domain/usecases/add_institution_receipts.dart'
    as _i84;
import '../features/institution_receipts/domain/usecases/get_institution_receipts.dart'
    as _i107;
import '../features/institution_receipts/presentation/cubit/institution_receipts_cubit.dart'
    as _i114;
import '../features/institutions/data/datasources/institutions_api_service.dart'
    as _i33;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i35;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i34;
import '../features/institutions/domain/usecases/get_institutions.dart'
    as _i102;
import '../features/institutions/presentation/cubit/institutions_cubit.dart'
    as _i115;
import '../features/instutution_items/data/datasources/items_api_service.dart'
    as _i38;
import '../features/instutution_items/data/datasources/units_api_service.dart'
    as _i69;
import '../features/instutution_items/data/repositories/items_repository_impl.dart'
    as _i41;
import '../features/instutution_items/data/repositories/units_repository_impl.dart'
    as _i71;
import '../features/instutution_items/domain/repositories/items_repository.dart'
    as _i40;
import '../features/instutution_items/domain/repositories/units_repository.dart'
    as _i70;
import '../features/instutution_items/domain/usecases/add_instition_item.dart'
    as _i83;
import '../features/instutution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i88;
import '../features/instutution_items/domain/usecases/add_unit_to_reference.dart'
    as _i89;
import '../features/instutution_items/domain/usecases/get_institution_items.dart'
    as _i106;
import '../features/instutution_items/domain/usecases/get_unit_suggestions.dart'
    as _i111;
import '../features/instutution_items/domain/usecases/search_item.dart' as _i64;
import '../features/instutution_items/domain/usecases/update_institution_item.dart'
    as _i75;
import '../features/instutution_items/presentation/bloc/add_item/add_item_bloc.dart'
    as _i141;
import '../features/instutution_items/presentation/bloc/add_unit/add_unit_bloc.dart'
    as _i142;
import '../features/instutution_items/presentation/cubit/institution_cart/institution_cart_cubit.dart'
    as _i29;
import '../features/instutution_items/presentation/cubit/institution_items/instutution_items_cubit.dart'
    as _i112;
import '../features/instutution_items/presentation/cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart'
    as _i37;
import '../features/jobs_offers/data/datasources/jobs_offers_api_service.dart'
    as _i45;
import '../features/jobs_offers/data/repositories/jobs_offers_repository_impl.dart'
    as _i47;
import '../features/jobs_offers/domain/repositories/jobs_offers_repository.dart'
    as _i46;
import '../features/jobs_offers/domain/usecases/accept_job_offer.dart' as _i80;
import '../features/jobs_offers/domain/usecases/decline_job_offer.dart'
    as _i100;
import '../features/jobs_offers/domain/usecases/get_jobs_offers.dart' as _i109;
import '../features/jobs_offers/presentation/cubit/jobs_offers_cubit.dart'
    as _i118;
import '../features/recruitment/data/datasources/recruitment_api_service.dart'
    as _i57;
import '../features/recruitment/data/repositories/recruitment_repository_impl.dart'
    as _i61;
import '../features/recruitment/domain/repositories/recruitment_repository.dart'
    as _i60;
import '../features/recruitment/domain/usecases/get_employees.dart' as _i105;
import '../features/recruitment/domain/usecases/get_sent_job_offers.dart'
    as _i110;
import '../features/recruitment/domain/usecases/remove_employee.dart' as _i62;
import '../features/recruitment/domain/usecases/remove_job_offer.dart' as _i63;
import '../features/recruitment/domain/usecases/send_job_offer.dart' as _i65;
import '../features/recruitment/presentation/cubit/employees/employees_cubit.dart'
    as _i145;
import '../features/recruitment/presentation/cubit/job_offers/send_job_offers_cubit.dart'
    as _i113;
import '../features/recruitment/presentation/cubit/recruitment/recruitment_cubit.dart'
    as _i59;
import '../features/settings/data/datasources/profile_api_service.dart' as _i52;
import '../features/settings/data/repositories/profile_repository_impl.dart'
    as _i56;
import '../features/settings/domain/repositories/profile_repository.dart'
    as _i55;
import '../features/settings/domain/usecases/update_email.dart' as _i73;
import '../features/settings/domain/usecases/update_phone_number.dart' as _i76;
import '../features/settings/domain/usecases/update_profile.dart' as _i78;
import '../features/settings/presentation/bloc/account_info/account_info_cubit.dart'
    as _i81;
import '../features/settings/presentation/bloc/add_email/add_email_cubit.dart'
    as _i147;
import '../features/settings/presentation/bloc/add_email/add_email_verification_cubit.dart'
    as _i136;
import '../features/settings/presentation/bloc/change_phone/update_phone_cubit.dart'
    as _i149;
import '../features/settings/presentation/bloc/change_phone/update_phone_verification_cubit.dart'
    as _i77;
import '../features/settings/presentation/bloc/cubit/update_email_cubit.dart'
    as _i74;
import '../features/start_up/data/datasources/local_data_source.dart' as _i48;
import '../features/start_up/data/repositories/start_up_repository_impl.dart'
    as _i68;
import '../features/start_up/domain/repositories/start_up_repository.dart'
    as _i67;
import '../features/start_up/domain/usecases/check_if_seen_before.dart' as _i99;
import '../features/start_up/domain/usecases/register_fcm_device_token.dart'
    as _i123;
import '../features/start_up/presentation/cubit/start_up/start_up_cubit.dart'
    as _i130;
import '../features/user_institutions/data/datasources/user_institutions_service_api.dart'
    as _i79;
import '../features/user_institutions/data/repositories/institutions_repository_impl.dart'
    as _i133;
import '../features/user_institutions/domain/repositories/institutions_repository.dart'
    as _i132;
import '../features/user_institutions/domain/usecases/add_institution.dart'
    as _i139;
import '../features/user_institutions/domain/usecases/get_user_institutions.dart'
    as _i146;
import '../features/user_institutions/domain/usecases/update_institution.dart'
    as _i148;
import '../features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i140;
import '../features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i150;
import 'register_module.dart' as _i151; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i12.AuthLocalService>(
      () => _i12.AuthLocalServiceImpl(get<_i13.CacheClient>()));
  gh.factory<_i14.CitiesSuggestionsBloc>(() => _i14.CitiesSuggestionsBloc(
      get<_i15.GetCitiesSuggestions>(), get<_i15.AddNewCity>()));
  gh.lazySingleton<_i16.DistributionAreaApiService>(
      () => _i16.DistributionAreaApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.factory<_i17.DistributionAreasBloc>(() => _i17.DistributionAreasBloc(
      get<_i15.GetGovernatesSuggestions>(),
      get<_i15.GetCitiesSuggestions>(),
      get<_i15.GetNeighborhoodsSuggestions>(),
      get<_i15.AddNewGovernate>(),
      get<_i15.AddNewCity>(),
      get<_i15.AddNewNeighborhood>(),
      get<_i18.GetDistributionAreas>(),
      get<_i18.AddDistributionArea>(),
      get<_i18.UpdateDistributionArea>(),
      get<_i18.DeleteDistributionArea>()));
  gh.lazySingleton<_i19.DistributionAreasRepository>(() =>
      _i20.DistributionAreasRepositoryImpl(
          get<_i16.DistributionAreaApiService>(), get<_i21.NetworkInfo>()));
  gh.factory<_i22.FacebookAuth>(() => registerModule.facebookAuth);
  gh.factory<_i23.FirebaseMessaging>(() => registerModule.firebaseMessaging);
  gh.lazySingleton<_i24.GetCitiesSuggestions>(
      () => _i24.GetCitiesSuggestions(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i25.GetDistributionAreas>(
      () => _i25.GetDistributionAreas(get<_i19.DistributionAreasRepository>()));
  gh.lazySingleton<_i26.GetGovernatesSuggestions>(() =>
      _i26.GetGovernatesSuggestions(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i27.GetNeighborhoodsSuggestions>(() =>
      _i27.GetNeighborhoodsSuggestions(
          get<_i7.AddressSuggestionsRepository>()));
  gh.factory<_i28.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i14.GovernatesSuggestionsBloc>(() =>
      _i14.GovernatesSuggestionsBloc(
          get<_i15.GetGovernatesSuggestions>(), get<_i15.AddNewGovernate>()));
  gh.factory<_i29.InstitutionCartCubit>(() => _i29.InstitutionCartCubit());
  gh.lazySingleton<_i30.InstitutionReceiptsApiService>(() =>
      _i30.InstitutionReceiptsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i31.InstitutionReceiptsRepository>(() =>
      _i32.InstitutionReceiptsRepositoryImpl(
          get<_i30.InstitutionReceiptsApiService>(), get<_i21.NetworkInfo>()));
  gh.lazySingleton<_i33.InstitutionsApiService>(
      () => _i33.InstitutionsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i34.InstitutionsRepository>(() =>
      _i35.InstitutionsRepositoryImpl(
          get<_i33.InstitutionsApiService>(), get<_i36.NetworkInfo>()));
  gh.factory<_i37.ItemAddToCartDialogCubit>(
      () => _i37.ItemAddToCartDialogCubit());
  gh.lazySingleton<_i38.ItemsApiService>(() => _i38.ItemsApiServiceImpl(
      get<_i11.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i39.ItemsApiService2>(
      () => _i39.ItemsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i40.ItemsRepository>(() => _i41.ItemsRepositoryImpl(
      get<_i38.ItemsApiService>(), get<_i21.NetworkInfo>()));
  gh.lazySingleton<_i42.ItemsRepository>(() => _i43.ItemsRepositoryImpl(
      get<_i39.ItemsApiService2>(), get<_i36.NetworkInfo>()));
  gh.factory<_i44.ItemsWidgetCubit>(() => _i44.ItemsWidgetCubit());
  gh.lazySingleton<_i45.JobsOffersApiService>(
      () => _i45.JobsOffersApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i46.JobsOffersRepository>(() =>
      _i47.JobsOffersRepositoryImpl(
          get<_i45.JobsOffersApiService>(), get<_i21.NetworkInfo>()));
  gh.lazySingleton<_i48.LocalDataSource>(
      () => _i48.LocalDataSourceImpl(get<_i49.SharedPreferences>()));
  gh.factory<_i14.NeighborhoodsSuggestionsBloc>(() =>
      _i14.NeighborhoodsSuggestionsBloc(get<_i15.GetNeighborhoodsSuggestions>(),
          get<_i15.AddNewNeighborhood>()));
  gh.factory<_i50.PhoneSignInFormCubit>(() => _i50.PhoneSignInFormCubit(
      get<_i51.VerifyPhoneNumber>(), get<_i51.SignInWithPhone>()));
  gh.lazySingleton<_i52.ProfileApiService>(() => _i52.ProfileApiServiceImpl(
      get<_i53.FirebaseAuth>(), get<_i54.FirebaseFirestore>()));
  gh.lazySingleton<_i55.ProfileRepository>(() => _i56.ProfileRepositoryImpl(
      get<_i52.ProfileApiService>(), get<_i21.NetworkInfo>()));
  gh.lazySingleton<_i57.RecruitmentApiService>(() =>
      _i57.RecruitmentApiServiceImpl(
          get<_i6.FirebaseFirestore>(), get<_i58.FirebaseFunctions>()));
  gh.factory<_i59.RecruitmentCubit>(() => _i59.RecruitmentCubit());
  gh.lazySingleton<_i60.RecruitmentRepository>(() =>
      _i61.RecruitmentRepositoryImpl(
          get<_i57.RecruitmentApiService>(), get<_i21.NetworkInfo>()));
  gh.lazySingleton<_i62.RemoveEmployee>(
      () => _i62.RemoveEmployee(get<_i60.RecruitmentRepository>()));
  gh.lazySingleton<_i63.RemoveJobOffer>(
      () => _i63.RemoveJobOffer(get<_i60.RecruitmentRepository>()));
  gh.lazySingleton<_i64.SearchItem>(
      () => _i64.SearchItem(get<_i40.ItemsRepository>()));
  gh.lazySingleton<_i65.SendJobOffer>(
      () => _i65.SendJobOffer(get<_i60.RecruitmentRepository>()));
  gh.factory<_i66.SmsAutoFill>(() => registerModule.smsAutoFill);
  gh.lazySingleton<_i67.StartUpRepository>(
      () => _i68.StartUpRepositoryImpl(get<_i48.LocalDataSource>()));
  gh.lazySingleton<_i69.UnitsApiService>(
      () => _i69.UnitsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i70.UnitsRepository>(() => _i71.UnitsRepositoryImpl(
      get<_i21.NetworkInfo>(), get<_i69.UnitsApiService>()));
  gh.lazySingleton<_i72.UpdateDistributionArea>(() =>
      _i72.UpdateDistributionArea(get<_i19.DistributionAreasRepository>()));
  gh.lazySingleton<_i73.UpdateEmail>(
      () => _i73.UpdateEmail(get<_i55.ProfileRepository>()));
  gh.factory<_i74.UpdateEmailCubit>(
      () => _i74.UpdateEmailCubit(get<_i73.UpdateEmail>()));
  gh.lazySingleton<_i75.UpdateInstitutionItem>(
      () => _i75.UpdateInstitutionItem(get<_i40.ItemsRepository>()));
  gh.lazySingleton<_i76.UpdatePhoneNumber>(
      () => _i76.UpdatePhoneNumber(get<_i55.ProfileRepository>()));
  gh.factory<_i77.UpdatePhoneVerificationCubit>(() =>
      _i77.UpdatePhoneVerificationCubit(
          get<_i76.UpdatePhoneNumber>(), get<_i66.SmsAutoFill>()));
  gh.lazySingleton<_i78.UpdateProfile>(
      () => _i78.UpdateProfile(get<_i55.ProfileRepository>()));
  gh.lazySingleton<_i79.UserInstitutionsServiceApi>(() =>
      _i79.UserInstitutionsServiceApiImpl(
          get<_i11.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i80.AcceptJobOffer>(
      () => _i80.AcceptJobOffer(get<_i46.JobsOffersRepository>()));
  gh.factory<_i81.AccountInfoCubit>(
      () => _i81.AccountInfoCubit(get<_i78.UpdateProfile>()));
  gh.lazySingleton<_i82.AddDistributionArea>(
      () => _i82.AddDistributionArea(get<_i19.DistributionAreasRepository>()));
  gh.lazySingleton<_i83.AddInstitutionItem>(
      () => _i83.AddInstitutionItem(get<_i40.ItemsRepository>()));
  gh.lazySingleton<_i84.AddInstitutionReceipt>(() =>
      _i84.AddInstitutionReceipt(get<_i31.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i85.AddNewCity>(
      () => _i85.AddNewCity(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i86.AddNewGovernate>(
      () => _i86.AddNewGovernate(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i87.AddNewNeighborhood>(
      () => _i87.AddNewNeighborhood(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i88.AddRefAndInstitutionItem>(
      () => _i88.AddRefAndInstitutionItem(get<_i40.ItemsRepository>()));
  gh.lazySingleton<_i89.AddUnitToReference>(
      () => _i89.AddUnitToReference(get<_i70.UnitsRepository>()));
  gh.factory<_i90.AddressSuggestionsBloc>(() => _i90.AddressSuggestionsBloc(
      get<_i26.GetGovernatesSuggestions>(),
      get<_i24.GetCitiesSuggestions>(),
      get<_i27.GetNeighborhoodsSuggestions>(),
      get<_i86.AddNewGovernate>(),
      get<_i85.AddNewCity>(),
      get<_i87.AddNewNeighborhood>()));
  gh.lazySingleton<_i91.AddressesRepository>(() => _i92.AddressesRepositoryImpl(
      get<_i10.AddressesServiceApi>(),
      get<_i21.NetworkInfo>(),
      get<_i9.AddressesLocalDataSource>()));
  gh.lazySingleton<_i93.AuthApiService>(() => _i93.AuthApiServiceImpl(
      firebaseAuth: get<_i53.FirebaseAuth>(),
      googleSignIn: get<_i94.GoogleSignIn>(),
      facebookAuth: get<_i95.FacebookAuth>(),
      firestore: get<_i54.FirebaseFirestore>(),
      cloudFunctions: get<_i96.FirebaseFunctions>(),
      firebaseMessaging: get<_i23.FirebaseMessaging>(),
      sharedPreferences: get<_i49.SharedPreferences>()));
  gh.lazySingleton<_i97.AuthRepository>(() => _i98.AuthRepositoryImpl(
      authApiService: get<_i93.AuthApiService>(),
      authLocalService: get<_i12.AuthLocalService>(),
      networkInfo: get<_i36.NetworkInfo>()));
  gh.lazySingleton<_i99.CheckIfSeenBefore>(
      () => _i99.CheckIfSeenBefore(get<_i67.StartUpRepository>()));
  gh.lazySingleton<_i100.DeclineJobOffer>(
      () => _i100.DeclineJobOffer(get<_i46.JobsOffersRepository>()));
  gh.lazySingleton<_i101.DeleteDistributionArea>(() =>
      _i101.DeleteDistributionArea(get<_i19.DistributionAreasRepository>()));
  gh.lazySingleton<_i102.GetAddressInstitutions>(
      () => _i102.GetAddressInstitutions(get<_i34.InstitutionsRepository>()));
  gh.lazySingleton<_i103.GetAddresses>(
      () => _i103.GetAddresses(get<_i91.AddressesRepository>()));
  gh.lazySingleton<_i104.GetCurrentLocation>(
      () => _i104.GetCurrentLocation(get<_i91.AddressesRepository>()));
  gh.lazySingleton<_i105.GetEmployees>(
      () => _i105.GetEmployees(get<_i60.RecruitmentRepository>()));
  gh.lazySingleton<_i106.GetInstitutionItems>(
      () => _i106.GetInstitutionItems(get<_i40.ItemsRepository>()));
  gh.lazySingleton<_i107.GetInstitutionReceipts>(() =>
      _i107.GetInstitutionReceipts(get<_i31.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i108.GetItems>(
      () => _i108.GetItems(get<_i42.ItemsRepository>()));
  gh.lazySingleton<_i109.GetJobsOffers>(
      () => _i109.GetJobsOffers(get<_i46.JobsOffersRepository>()));
  gh.lazySingleton<_i110.GetSentJobOffers>(
      () => _i110.GetSentJobOffers(get<_i60.RecruitmentRepository>()));
  gh.lazySingleton<_i111.GetUnitSuggestions>(
      () => _i111.GetUnitSuggestions(get<_i70.UnitsRepository>()));
  gh.factory<_i112.InstitutionItemsCubit>(
      () => _i112.InstitutionItemsCubit(get<_i106.GetInstitutionItems>()));
  gh.factory<_i113.InstitutionJobsOffersCubit>(() =>
      _i113.InstitutionJobsOffersCubit(get<_i110.GetSentJobOffers>(),
          get<_i65.SendJobOffer>(), get<_i63.RemoveJobOffer>()));
  gh.factory<_i114.InstitutionReceiptsCubit>(() =>
      _i114.InstitutionReceiptsCubit(
          get<_i106.GetInstitutionItems>(),
          get<_i107.GetInstitutionReceipts>(),
          get<_i84.AddInstitutionReceipt>()));
  gh.factory<_i115.InstitutionsCubit>(
      () => _i115.InstitutionsCubit(get<_i102.GetAddressInstitutions>()));
  gh.factory<_i116.IsPhoneExistsUsecase>(
      () => _i116.IsPhoneExistsUsecase(get<_i97.AuthRepository>()));
  gh.factory<_i117.ItemsCubit>(() => _i117.ItemsCubit(get<_i108.GetItems>()));
  gh.factory<_i118.JobsOffersCubit>(() => _i118.JobsOffersCubit(
      get<_i109.GetJobsOffers>(),
      get<_i80.AcceptJobOffer>(),
      get<_i100.DeclineJobOffer>()));
  gh.lazySingleton<_i119.LinkEmailAndPassword>(
      () => _i119.LinkEmailAndPassword(get<_i97.AuthRepository>()));
  gh.factory<_i120.LocationWidgetCubit>(
      () => _i120.LocationWidgetCubit(get<_i104.GetCurrentLocation>()));
  gh.lazySingleton<_i121.LogOut>(
      () => _i121.LogOut(get<_i97.AuthRepository>()));
  gh.lazySingleton<_i122.PhoneSignUp>(
      () => _i122.PhoneSignUp(get<_i97.AuthRepository>()));
  gh.lazySingleton<_i123.RegisterFcmDeviceToken>(
      () => _i123.RegisterFcmDeviceToken(get<_i67.StartUpRepository>()));
  gh.lazySingleton<_i124.RemoveAddress>(
      () => _i124.RemoveAddress(get<_i91.AddressesRepository>()));
  gh.factory<_i125.SelectLocationMapBloc>(
      () => _i125.SelectLocationMapBloc(get<_i104.GetCurrentLocation>()));
  gh.lazySingleton<_i126.SignInWithEmailAndPassword>(
      () => _i126.SignInWithEmailAndPassword(get<_i97.AuthRepository>()));
  gh.lazySingleton<_i127.SignInWithFacebook>(
      () => _i127.SignInWithFacebook(get<_i97.AuthRepository>()));
  gh.lazySingleton<_i128.SignInWithGoogle>(
      () => _i128.SignInWithGoogle(get<_i97.AuthRepository>()));
  gh.lazySingleton<_i129.SignInWithPhone>(
      () => _i129.SignInWithPhone(get<_i97.AuthRepository>()));
  gh.factory<_i130.StartUpCubit>(
      () => _i130.StartUpCubit(get<_i99.CheckIfSeenBefore>()));
  gh.lazySingleton<_i131.UpdateAddress>(
      () => _i131.UpdateAddress(get<_i91.AddressesRepository>()));
  gh.lazySingleton<_i132.UserInstitutionsRepository>(() =>
      _i133.UserInstitutionsRepositoryImpl(
          get<_i79.UserInstitutionsServiceApi>(), get<_i36.NetworkInfo>()));
  gh.lazySingleton<_i134.VerifyPhoneNumber>(
      () => _i134.VerifyPhoneNumber(get<_i97.AuthRepository>()));
  gh.lazySingleton<_i135.AddAddress>(
      () => _i135.AddAddress(get<_i91.AddressesRepository>()));
  gh.factory<_i136.AddEmailVerificationCubit>(() =>
      _i136.AddEmailVerificationCubit(
          get<_i119.LinkEmailAndPassword>(), get<_i66.SmsAutoFill>()));
  gh.lazySingleton<_i137.AddFirstAddress>(
      () => _i137.AddFirstAddress(get<_i91.AddressesRepository>()));
  gh.lazySingleton<_i138.AddFirstAddressCubit>(
      () => _i138.AddFirstAddressCubit(get<_i137.AddFirstAddress>()));
  gh.lazySingleton<_i139.AddInstitution>(
      () => _i139.AddInstitution(get<_i132.UserInstitutionsRepository>()));
  gh.factory<_i140.AddInstitutionCubit>(
      () => _i140.AddInstitutionCubit(get<_i139.AddInstitution>()));
  gh.factory<_i141.AddItemBloc>(() => _i141.AddItemBloc(
      get<_i64.SearchItem>(),
      get<_i83.AddInstitutionItem>(),
      get<_i88.AddRefAndInstitutionItem>(),
      get<_i75.UpdateInstitutionItem>()));
  gh.factory<_i142.AddUnitBloc>(() => _i142.AddUnitBloc(
      get<_i111.GetUnitSuggestions>(), get<_i89.AddUnitToReference>()));
  gh.factory<_i143.AddressesCubit>(
      () => _i143.AddressesCubit(get<_i103.GetAddresses>()));
  gh.factory<_i144.AppBloc>(
      () => _i144.AppBloc(authRepository: get<_i97.AuthRepository>()));
  gh.factory<_i145.EmployeesCubit>(() => _i145.EmployeesCubit(
      get<_i105.GetEmployees>(), get<_i62.RemoveEmployee>()));
  gh.lazySingleton<_i146.GetUserInstitutions>(
      () => _i146.GetUserInstitutions(get<_i132.UserInstitutionsRepository>()));
  gh.factory<_i147.LinkEmailAndPasswordCubit>(
      () => _i147.LinkEmailAndPasswordCubit(get<_i134.VerifyPhoneNumber>()));
  gh.lazySingleton<_i148.UpdateInstitution>(
      () => _i148.UpdateInstitution(get<_i132.UserInstitutionsRepository>()));
  gh.factory<_i149.UpdatePhoneCubit>(
      () => _i149.UpdatePhoneCubit(get<_i134.VerifyPhoneNumber>()));
  gh.factory<_i150.UserInstitutionsCubit>(
      () => _i150.UserInstitutionsCubit(get<_i146.GetUserInstitutions>()));
  return get;
}

class _$RegisterModule extends _i151.RegisterModule {}
