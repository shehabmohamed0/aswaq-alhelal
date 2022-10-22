// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i62;
import 'package:cloud_functions/cloud_functions.dart' as _i109;
import 'package:firebase_auth/firebase_auth.dart' as _i61;
import 'package:firebase_messaging/firebase_messaging.dart' as _i24;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i108;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i107;
import 'package:injectable/injectable.dart' as _i2;
import 'package:localstorage/localstorage.dart' as _i52;
import 'package:root_package/core/services/network_info.dart' as _i17;
import 'package:root_package/packages/cloud_firestore.dart' as _i4;
import 'package:root_package/packages/cloud_functions.dart' as _i66;
import 'package:root_package/packages/firebase_auth.dart' as _i9;
import 'package:root_package/packages/firebase_remote_config.dart' as _i77;
import 'package:root_package/packages/flutter_facebook_auth.dart' as _i23;
import 'package:root_package/packages/google_sign_in.dart' as _i30;
import 'package:root_package/packages/shared_preferences.dart' as _i11;
import 'package:root_package/root_package.dart' as _i41;
import 'package:sms_autofill/sms_autofill.dart' as _i74;

import '../core/services/firebase_notification_service.dart' as _i54;
import '../core/services/notification_service.dart' as _i53;
import '../features/address/data/datasources/address_local_data_source.dart'
    as _i7;
import '../features/address/data/datasources/addresses_service_api.dart' as _i8;
import '../features/address/data/repositories/addresses_repository_impl.dart'
    as _i105;
import '../features/address/domain/repositories/addresses_repository.dart'
    as _i104;
import '../features/address/domain/usecases/add_address.dart' as _i152;
import '../features/address/domain/usecases/add_first_address.dart' as _i156;
import '../features/address/domain/usecases/get_addresses.dart' as _i115;
import '../features/address/domain/usecases/get_current_location.dart' as _i116;
import '../features/address/domain/usecases/remove_address.dart' as _i138;
import '../features/address/domain/usecases/update_address.dart' as _i144;
import '../features/address/domain/usecases/update_main_address.dart' as _i145;
import '../features/address/domain/usecases/usecases.dart' as _i154;
import '../features/address/presentation/bloc/select_location_map/select_location_map_bloc.dart'
    as _i139;
import '../features/address/presentation/cubit/add_edit_address/add_edit_address_cubit.dart'
    as _i153;
import '../features/address/presentation/cubit/add_first_address/add_first_address_cubit.dart'
    as _i157;
import '../features/address/presentation/cubit/addresses/addresses_cubit.dart'
    as _i161;
import '../features/address_suggestions/data/datasources/address_suggestions_api_service.dart'
    as _i3;
import '../features/address_suggestions/data/repositories/address_suggestions_repository_impl.dart'
    as _i6;
import '../features/address_suggestions/domain/repositories/address_suggestions_repository.dart'
    as _i5;
import '../features/address_suggestions/domain/usecases/add_new_city.dart'
    as _i99;
import '../features/address_suggestions/domain/usecases/add_new_governate.dart'
    as _i100;
import '../features/address_suggestions/domain/usecases/add_new_neighborhood.dart'
    as _i101;
import '../features/address_suggestions/domain/usecases/get_cities_suggetsions.dart'
    as _i25;
import '../features/address_suggestions/domain/usecases/get_districts_suggestions.dart'
    as _i29;
import '../features/address_suggestions/domain/usecases/get_governates_suggestions.dart'
    as _i28;
import '../features/address_suggestions/domain/usecases/usecases.dart' as _i13;
import '../features/address_suggestions/presentation/bloc/address_suggestions_bloc.dart'
    as _i12;
import '../features/address_suggestions/presentation/cubit/location_widget/location_widget_cubit.dart'
    as _i134;
import '../features/auth/data/datasources/local/auth_local_service.dart'
    as _i10;
import '../features/auth/data/datasources/remote/auth_api_service.dart'
    as _i106;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i111;
import '../features/auth/domain/repositories/auth_repository.dart' as _i110;
import '../features/auth/domain/usecases/link_email_and_password.dart' as _i133;
import '../features/auth/domain/usecases/log_out.dart' as _i135;
import '../features/auth/domain/usecases/sign_in_with_phone.dart' as _i140;
import '../features/auth/domain/usecases/usecases.dart' as _i59;
import '../features/auth/domain/usecases/verify_phone_number.dart' as _i149;
import '../features/auth/presentation/bloc/app_status/app_bloc.dart' as _i162;
import '../features/auth/presentation/bloc/sign_in/phone_sign_in_form_cubit.dart'
    as _i58;
import '../features/cart/presentation/cubit/institution_cart/institution_cart_cubit.dart'
    as _i31;
import '../features/cart/presentation/cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart'
    as _i42;
import '../features/client_institutions/data/datasources/client_institution_items_api.dart'
    as _i14;
import '../features/client_institutions/data/repositories/client_institution_repository_impl.dart'
    as _i16;
import '../features/client_institutions/domain/repositories/client_institution_repository.dart'
    as _i15;
import '../features/client_institutions/domain/usecases/get_client_institution_item.dart'
    as _i26;
import '../features/client_institutions/presentation/cubit/client_institution/client_institutions_cubit.dart'
    as _i164;
import '../features/distribution_areas/data/datasources/distribution_area_api_service.dart'
    as _i18;
import '../features/distribution_areas/data/repositories/distribution_areas_repository_impl.dart'
    as _i22;
import '../features/distribution_areas/domain/repositories/distribution_area_repository.dart'
    as _i21;
import '../features/distribution_areas/domain/usecases/add_distribution_area.dart'
    as _i96;
import '../features/distribution_areas/domain/usecases/delete_distribution_area.dart'
    as _i113;
import '../features/distribution_areas/domain/usecases/get_distribution_areas.dart'
    as _i27;
import '../features/distribution_areas/domain/usecases/update_distribution_area.dart'
    as _i81;
import '../features/distribution_areas/domain/usecases/usecases.dart' as _i20;
import '../features/distribution_areas/presentation/bloc/distribution_areas_bloc.dart'
    as _i19;
import '../features/home/data/datasources/items_api_servic.dart' as _i44;
import '../features/home/data/repositories/items_repository_impl.dart' as _i48;
import '../features/home/domain/repositories/items_repository.dart' as _i47;
import '../features/home/domain/usecases/get_items.dart' as _i121;
import '../features/home/presentation/cubit/items/items_cubit.dart' as _i131;
import '../features/institution_items/data/datasources/items_api_service.dart'
    as _i43;
import '../features/institution_items/data/datasources/units_api_service.dart'
    as _i78;
import '../features/institution_items/data/repositories/items_repository_impl.dart'
    as _i46;
import '../features/institution_items/data/repositories/units_repository_impl.dart'
    as _i80;
import '../features/institution_items/domain/repositories/items_repository.dart'
    as _i45;
import '../features/institution_items/domain/repositories/units_repository.dart'
    as _i79;
import '../features/institution_items/domain/usecases/add_instition_item.dart'
    as _i97;
import '../features/institution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i102;
import '../features/institution_items/domain/usecases/add_unit_to_reference.dart'
    as _i103;
import '../features/institution_items/domain/usecases/get_institution_items.dart'
    as _i118;
import '../features/institution_items/domain/usecases/get_unit_suggestions.dart'
    as _i124;
import '../features/institution_items/domain/usecases/search_item.dart' as _i72;
import '../features/institution_items/domain/usecases/update_institution_item.dart'
    as _i84;
import '../features/institution_items/presentation/bloc/add_item/add_item_bloc.dart'
    as _i160;
import '../features/institution_items/presentation/bloc/unit_entry/unit_entry_bloc.dart'
    as _i143;
import '../features/institution_items/presentation/cubit/institution_items/institution_items_cubit.dart'
    as _i126;
import '../features/institution_receipts/data/datasources/institution_receipts_api_service.dart'
    as _i35;
import '../features/institution_receipts/data/repositories/institution_receipts_repository_impl.dart'
    as _i37;
import '../features/institution_receipts/domain/repositories/institution_receipts_repository.dart'
    as _i36;
import '../features/institution_receipts/domain/usecases/add_institution_receipts.dart'
    as _i98;
import '../features/institution_receipts/domain/usecases/get_institution_receipts.dart'
    as _i120;
import '../features/institution_receipts/presentation/cubit/institution_receipts_cubit.dart'
    as _i129;
import '../features/institutions/data/datasources/institutions_api_service.dart'
    as _i38;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i40;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i39;
import '../features/institutions/domain/usecases/get_institutions.dart'
    as _i114;
import '../features/institutions/presentation/cubit/institutions_cubit.dart'
    as _i130;
import '../features/jobs_offers/data/datasources/jobs_offers_api_service.dart'
    as _i49;
import '../features/jobs_offers/data/repositories/jobs_offers_repository_impl.dart'
    as _i51;
import '../features/jobs_offers/domain/repositories/jobs_offers_repository.dart'
    as _i50;
import '../features/jobs_offers/domain/usecases/accept_job_offer.dart' as _i94;
import '../features/jobs_offers/domain/usecases/decline_job_offer.dart'
    as _i112;
import '../features/jobs_offers/domain/usecases/get_jobs_offers.dart' as _i122;
import '../features/jobs_offers/presentation/cubit/jobs_offers_cubit.dart'
    as _i132;
import '../features/notifications/data/datasources/notifications_remote_api.dart'
    as _i55;
import '../features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i57;
import '../features/notifications/domain/repositories/notifications_repository.dart'
    as _i56;
import '../features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i136;
import '../features/orders/data/datasources/institution_orders_api_service.dart'
    as _i32;
import '../features/orders/data/datasources/user_orders_api_service.dart'
    as _i90;
import '../features/orders/data/repositories/institution_orders_repository_impl.dart'
    as _i34;
import '../features/orders/data/repositories/user_orders_repository_impl.dart'
    as _i92;
import '../features/orders/domain/repositories/institution_orders_repository.dart'
    as _i33;
import '../features/orders/domain/repositories/user_orders_repository.dart'
    as _i91;
import '../features/orders/domain/usecases/get_institution_orders.dart'
    as _i119;
import '../features/orders/domain/usecases/get_user_orders.dart' as _i125;
import '../features/orders/domain/usecases/place_order.dart' as _i137;
import '../features/orders/domain/usecases/update_institution_order.dart'
    as _i85;
import '../features/orders/presentation/cubit/cubit/institution_orders_cubit.dart'
    as _i128;
import '../features/orders/presentation/cubit/user_orders/user_orders_bloc.dart'
    as _i148;
import '../features/recruitment/data/datasources/recruitment_api_service.dart'
    as _i65;
import '../features/recruitment/data/repositories/recruitment_repository_impl.dart'
    as _i69;
import '../features/recruitment/domain/repositories/recruitment_repository.dart'
    as _i68;
import '../features/recruitment/domain/usecases/get_employees.dart' as _i117;
import '../features/recruitment/domain/usecases/get_sent_job_offers.dart'
    as _i123;
import '../features/recruitment/domain/usecases/remove_employee.dart' as _i70;
import '../features/recruitment/domain/usecases/remove_job_offer.dart' as _i71;
import '../features/recruitment/domain/usecases/send_job_offer.dart' as _i73;
import '../features/recruitment/presentation/cubit/employees/employees_cubit.dart'
    as _i165;
import '../features/recruitment/presentation/cubit/job_offers/send_job_offers_cubit.dart'
    as _i127;
import '../features/recruitment/presentation/cubit/recruitment/recruitment_cubit.dart'
    as _i67;
import '../features/settings/data/datasources/profile_api_service.dart' as _i60;
import '../features/settings/data/repositories/profile_repository_impl.dart'
    as _i64;
import '../features/settings/domain/repositories/profile_repository.dart'
    as _i63;
import '../features/settings/domain/usecases/update_email.dart' as _i82;
import '../features/settings/domain/usecases/update_phone_number.dart' as _i86;
import '../features/settings/domain/usecases/update_profile.dart' as _i88;
import '../features/settings/presentation/bloc/account_info/account_info_cubit.dart'
    as _i95;
import '../features/settings/presentation/bloc/add_email/add_email_cubit.dart'
    as _i168;
import '../features/settings/presentation/bloc/add_email/add_email_verification_cubit.dart'
    as _i155;
import '../features/settings/presentation/bloc/change_phone/update_phone_cubit.dart'
    as _i172;
import '../features/settings/presentation/bloc/change_phone/update_phone_verification_cubit.dart'
    as _i87;
import '../features/settings/presentation/bloc/cubit/update_email_cubit.dart'
    as _i83;
import '../features/start_up/data/datasources/startup_local_api.dart' as _i75;
import '../features/start_up/data/datasources/startup_remote_api.dart' as _i76;
import '../features/start_up/data/repositories/startup_repository_impl.dart'
    as _i142;
import '../features/start_up/domain/repositories/start_up_repository.dart'
    as _i141;
import '../features/start_up/domain/usecases/check_if_seen_before.dart'
    as _i163;
import '../features/start_up/domain/usecases/needs_a_forced_update.dart'
    as _i169;
import '../features/start_up/presentation/cubit/start_up/start_up_cubit.dart'
    as _i170;
import '../features/user_institutions/data/datasources/user_institutions_service_api.dart'
    as _i89;
import '../features/user_institutions/data/repositories/institutions_repository_impl.dart'
    as _i147;
import '../features/user_institutions/domain/repositories/institutions_repository.dart'
    as _i146;
import '../features/user_institutions/domain/usecases/add_institution.dart'
    as _i158;
import '../features/user_institutions/domain/usecases/get_user_institutions.dart'
    as _i166;
import '../features/user_institutions/domain/usecases/update_institution.dart'
    as _i171;
import '../features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i159;
import '../features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i173;
import '../features/work_institutions/data/datasources/work_institution_api_service.dart'
    as _i93;
import '../features/work_institutions/data/repositories/work_institution_repository_impl.dart'
    as _i151;
import '../features/work_institutions/domain/usecases/get_work_institutions.dart'
    as _i167;
import '../features/work_institutions/domain/work_institution_repository.dart'
    as _i150;
import '../features/work_institutions/presentation/cubit/work_institutions_cubit.dart'
    as _i174;
import 'register_module.dart' as _i175; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
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
  gh.lazySingleton<_i10.AuthLocalService>(
      () => _i10.AuthLocalServiceImpl(get<_i11.SharedPreferences>()));
  gh.factory<_i12.CitiesSuggestionsBloc>(() => _i12.CitiesSuggestionsBloc(
      get<_i13.GetCitiesSuggestions>(), get<_i13.AddNewCity>()));
  gh.lazySingleton<_i14.ClientInstitutionItemsApi>(
      () => _i14.ClientInstitutionItemsApiImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i15.ClientInstitutionRepository>(() =>
      _i16.ClientInstitutionRepositoryImpl(
          get<_i14.ClientInstitutionItemsApi>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i18.DistributionAreaApiService>(
      () => _i18.DistributionAreaApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.factory<_i19.DistributionAreasBloc>(() => _i19.DistributionAreasBloc(
      get<_i13.GetGovernatesSuggestions>(),
      get<_i13.GetCitiesSuggestions>(),
      get<_i13.GetNeighborhoodsSuggestions>(),
      get<_i13.AddNewGovernate>(),
      get<_i13.AddNewCity>(),
      get<_i13.AddNewNeighborhood>(),
      get<_i20.GetDistributionAreas>(),
      get<_i20.AddDistributionArea>(),
      get<_i20.UpdateDistributionArea>(),
      get<_i20.DeleteDistributionArea>()));
  gh.lazySingleton<_i21.DistributionAreasRepository>(() =>
      _i22.DistributionAreasRepositoryImpl(
          get<_i18.DistributionAreaApiService>(), get<_i17.NetworkInfo>()));
  gh.factory<_i23.FacebookAuth>(() => registerModule.facebookAuth);
  gh.factory<_i24.FirebaseMessaging>(() => registerModule.firebaseMessaging);
  gh.lazySingleton<_i25.GetCitiesSuggestions>(
      () => _i25.GetCitiesSuggestions(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i26.GetClientInstitutionItems>(() =>
      _i26.GetClientInstitutionItems(get<_i15.ClientInstitutionRepository>()));
  gh.lazySingleton<_i27.GetDistributionAreas>(
      () => _i27.GetDistributionAreas(get<_i21.DistributionAreasRepository>()));
  gh.lazySingleton<_i28.GetGovernatesSuggestions>(() =>
      _i28.GetGovernatesSuggestions(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i29.GetNeighborhoodsSuggestions>(() =>
      _i29.GetNeighborhoodsSuggestions(
          get<_i5.AddressSuggestionsRepository>()));
  gh.factory<_i30.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i12.GovernatesSuggestionsBloc>(() =>
      _i12.GovernatesSuggestionsBloc(
          get<_i13.GetGovernatesSuggestions>(), get<_i13.AddNewGovernate>()));
  gh.factory<_i31.InstitutionCartCubit>(() => _i31.InstitutionCartCubit());
  gh.lazySingleton<_i32.InstitutionOrdersApiService>(
      () => _i32.InstitutionOrdersApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i33.InstitutionOrdersRepository>(() =>
      _i34.InstitutionOrdersRepositoryImpl(
          get<_i32.InstitutionOrdersApiService>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i35.InstitutionReceiptsApiService>(() =>
      _i35.InstitutionReceiptsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i36.InstitutionReceiptsRepository>(() =>
      _i37.InstitutionReceiptsRepositoryImpl(
          get<_i35.InstitutionReceiptsApiService>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i38.InstitutionsApiService>(
      () => _i38.InstitutionsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i39.InstitutionsRepository>(() =>
      _i40.InstitutionsRepositoryImpl(
          get<_i38.InstitutionsApiService>(), get<_i41.NetworkInfo>()));
  gh.factory<_i42.ItemAddToCartDialogCubit>(
      () => _i42.ItemAddToCartDialogCubit());
  gh.lazySingleton<_i43.ItemsApiService>(() => _i43.ItemsApiServiceImpl(
      get<_i9.FirebaseAuth>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i44.ItemsApiService2>(
      () => _i44.ItemsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i45.ItemsRepository>(() => _i46.ItemsRepositoryImpl(
      get<_i43.ItemsApiService>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i47.ItemsRepository>(() => _i48.ItemsRepositoryImpl(
      get<_i44.ItemsApiService2>(), get<_i41.NetworkInfo>()));
  gh.lazySingleton<_i49.JobsOffersApiService>(
      () => _i49.JobsOffersApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i50.JobsOffersRepository>(() =>
      _i51.JobsOffersRepositoryImpl(
          get<_i49.JobsOffersApiService>(), get<_i17.NetworkInfo>()));
  await gh.factoryAsync<_i52.LocalStorage>(() => registerModule.localStorage,
      preResolve: true);
  gh.factory<_i12.NeighborhoodsSuggestionsBloc>(() =>
      _i12.NeighborhoodsSuggestionsBloc(get<_i13.GetNeighborhoodsSuggestions>(),
          get<_i13.AddNewNeighborhood>()));
  gh.lazySingleton<_i53.NotificationService>(
      () => _i54.FirebaseNotificationService());
  gh.lazySingleton<_i55.NotificationsApiService>(() =>
      _i55.NotificationsApiServiceImpl(
          get<_i4.FirebaseFirestore>(), get<_i9.FirebaseAuth>()));
  gh.lazySingleton<_i56.NotificationsRepository>(() =>
      _i57.NotificationsRepositoryImpl(
          get<_i55.NotificationsApiService>(), get<_i17.NetworkInfo>()));
  gh.factory<_i58.PhoneSignInFormCubit>(() => _i58.PhoneSignInFormCubit(
      get<_i59.VerifyPhoneNumber>(), get<_i59.SignInWithPhone>()));
  gh.lazySingleton<_i60.ProfileApiService>(() => _i60.ProfileApiServiceImpl(
      get<_i61.FirebaseAuth>(), get<_i62.FirebaseFirestore>()));
  gh.lazySingleton<_i63.ProfileRepository>(() => _i64.ProfileRepositoryImpl(
      get<_i60.ProfileApiService>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i65.RecruitmentApiService>(() =>
      _i65.RecruitmentApiServiceImpl(
          get<_i4.FirebaseFirestore>(), get<_i66.FirebaseFunctions>()));
  gh.factory<_i67.RecruitmentCubit>(() => _i67.RecruitmentCubit());
  gh.lazySingleton<_i68.RecruitmentRepository>(() =>
      _i69.RecruitmentRepositoryImpl(
          get<_i65.RecruitmentApiService>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i70.RemoveEmployee>(
      () => _i70.RemoveEmployee(get<_i68.RecruitmentRepository>()));
  gh.lazySingleton<_i71.RemoveJobOffer>(
      () => _i71.RemoveJobOffer(get<_i68.RecruitmentRepository>()));
  gh.lazySingleton<_i72.SearchItem>(
      () => _i72.SearchItem(get<_i45.ItemsRepository>()));
  gh.lazySingleton<_i73.SendJobOffer>(
      () => _i73.SendJobOffer(get<_i68.RecruitmentRepository>()));
  gh.factory<_i74.SmsAutoFill>(() => registerModule.smsAutoFill);
  gh.lazySingleton<_i75.StartupLocalApi>(
      () => _i75.StartUpLocalApiImpl(get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i76.StartupRemoteApi>(
      () => _i76.StartupRemoteApiImpl(get<_i77.FirebaseRemoteConfig>()));
  gh.lazySingleton<_i78.UnitsApiService>(
      () => _i78.UnitsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i79.UnitsRepository>(() => _i80.UnitsRepositoryImpl(
      get<_i17.NetworkInfo>(), get<_i78.UnitsApiService>()));
  gh.lazySingleton<_i81.UpdateDistributionArea>(() =>
      _i81.UpdateDistributionArea(get<_i21.DistributionAreasRepository>()));
  gh.lazySingleton<_i82.UpdateEmail>(
      () => _i82.UpdateEmail(get<_i63.ProfileRepository>()));
  gh.factory<_i83.UpdateEmailCubit>(
      () => _i83.UpdateEmailCubit(get<_i82.UpdateEmail>()));
  gh.lazySingleton<_i84.UpdateInstitutionItem>(
      () => _i84.UpdateInstitutionItem(get<_i45.ItemsRepository>()));
  gh.lazySingleton<_i85.UpdateInstitutionOrder>(() =>
      _i85.UpdateInstitutionOrder(get<_i33.InstitutionOrdersRepository>()));
  gh.lazySingleton<_i86.UpdatePhoneNumber>(
      () => _i86.UpdatePhoneNumber(get<_i63.ProfileRepository>()));
  gh.factory<_i87.UpdatePhoneVerificationCubit>(() =>
      _i87.UpdatePhoneVerificationCubit(
          get<_i86.UpdatePhoneNumber>(), get<_i74.SmsAutoFill>()));
  gh.lazySingleton<_i88.UpdateProfile>(
      () => _i88.UpdateProfile(get<_i63.ProfileRepository>()));
  gh.lazySingleton<_i89.UserInstitutionsServiceApi>(() =>
      _i89.UserInstitutionsServiceApiImpl(
          get<_i9.FirebaseAuth>(), get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i90.UserOrdersApiService>(
      () => _i90.UserOrdersApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i91.UserOrdersRepository>(() =>
      _i92.UserOrdersRepositoryImpl(
          get<_i90.UserOrdersApiService>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i93.WorkIstitutionsApiService>(
      () => _i93.WorkIstitutionsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i94.AcceptJobOffer>(
      () => _i94.AcceptJobOffer(get<_i50.JobsOffersRepository>()));
  gh.factory<_i95.AccountInfoCubit>(
      () => _i95.AccountInfoCubit(get<_i88.UpdateProfile>()));
  gh.lazySingleton<_i96.AddDistributionArea>(
      () => _i96.AddDistributionArea(get<_i21.DistributionAreasRepository>()));
  gh.lazySingleton<_i97.AddInstitutionItem>(
      () => _i97.AddInstitutionItem(get<_i45.ItemsRepository>()));
  gh.lazySingleton<_i98.AddInstitutionReceipt>(() =>
      _i98.AddInstitutionReceipt(get<_i36.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i99.AddNewCity>(
      () => _i99.AddNewCity(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i100.AddNewGovernate>(
      () => _i100.AddNewGovernate(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i101.AddNewNeighborhood>(
      () => _i101.AddNewNeighborhood(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i102.AddRefAndInstitutionItem>(
      () => _i102.AddRefAndInstitutionItem(get<_i45.ItemsRepository>()));
  gh.lazySingleton<_i103.AddUnitToReference>(
      () => _i103.AddUnitToReference(get<_i79.UnitsRepository>()));
  gh.lazySingleton<_i104.AddressesRepository>(() =>
      _i105.AddressesRepositoryImpl(get<_i8.AddressesServiceApi>(),
          get<_i17.NetworkInfo>(), get<_i7.AddressesLocalDataSource>()));
  gh.lazySingleton<_i106.AuthApiService>(() => _i106.AuthApiServiceImpl(
      firebaseAuth: get<_i61.FirebaseAuth>(),
      googleSignIn: get<_i107.GoogleSignIn>(),
      facebookAuth: get<_i108.FacebookAuth>(),
      firestore: get<_i62.FirebaseFirestore>(),
      cloudFunctions: get<_i109.FirebaseFunctions>(),
      firebaseMessaging: get<_i24.FirebaseMessaging>(),
      sharedPreferences: get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i110.AuthRepository>(() => _i111.AuthRepositoryImpl(
      authApiService: get<_i106.AuthApiService>(),
      authLocalService: get<_i10.AuthLocalService>(),
      networkInfo: get<_i41.NetworkInfo>()));
  gh.lazySingleton<_i112.DeclineJobOffer>(
      () => _i112.DeclineJobOffer(get<_i50.JobsOffersRepository>()));
  gh.lazySingleton<_i113.DeleteDistributionArea>(() =>
      _i113.DeleteDistributionArea(get<_i21.DistributionAreasRepository>()));
  gh.lazySingleton<_i114.GetAddressInstitutions>(
      () => _i114.GetAddressInstitutions(get<_i39.InstitutionsRepository>()));
  gh.lazySingleton<_i115.GetAddresses>(
      () => _i115.GetAddresses(get<_i104.AddressesRepository>()));
  gh.lazySingleton<_i116.GetCurrentLocation>(
      () => _i116.GetCurrentLocation(get<_i104.AddressesRepository>()));
  gh.lazySingleton<_i117.GetEmployees>(
      () => _i117.GetEmployees(get<_i68.RecruitmentRepository>()));
  gh.lazySingleton<_i118.GetInstitutionItems>(
      () => _i118.GetInstitutionItems(get<_i45.ItemsRepository>()));
  gh.lazySingleton<_i119.GetInstitutionOrders>(() =>
      _i119.GetInstitutionOrders(get<_i33.InstitutionOrdersRepository>()));
  gh.lazySingleton<_i120.GetInstitutionReceipts>(() =>
      _i120.GetInstitutionReceipts(get<_i36.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i121.GetItems>(
      () => _i121.GetItems(get<_i47.ItemsRepository>()));
  gh.lazySingleton<_i122.GetJobsOffers>(
      () => _i122.GetJobsOffers(get<_i50.JobsOffersRepository>()));
  gh.lazySingleton<_i123.GetSentJobOffers>(
      () => _i123.GetSentJobOffers(get<_i68.RecruitmentRepository>()));
  gh.lazySingleton<_i124.GetUnitSuggestions>(
      () => _i124.GetUnitSuggestions(get<_i79.UnitsRepository>()));
  gh.lazySingleton<_i125.GetUserOrders>(
      () => _i125.GetUserOrders(get<_i91.UserOrdersRepository>()));
  gh.factory<_i126.InstitutionItemsCubit>(
      () => _i126.InstitutionItemsCubit(get<_i118.GetInstitutionItems>()));
  gh.factory<_i127.InstitutionJobsOffersCubit>(() =>
      _i127.InstitutionJobsOffersCubit(get<_i123.GetSentJobOffers>(),
          get<_i73.SendJobOffer>(), get<_i71.RemoveJobOffer>()));
  gh.factory<_i128.InstitutionOrdersCubit>(() => _i128.InstitutionOrdersCubit(
      get<_i119.GetInstitutionOrders>(), get<_i85.UpdateInstitutionOrder>()));
  gh.factory<_i129.InstitutionReceiptsCubit>(() =>
      _i129.InstitutionReceiptsCubit(
          get<_i118.GetInstitutionItems>(),
          get<_i120.GetInstitutionReceipts>(),
          get<_i98.AddInstitutionReceipt>()));
  gh.factory<_i130.InstitutionsCubit>(
      () => _i130.InstitutionsCubit(get<_i114.GetAddressInstitutions>()));
  gh.factory<_i131.ItemsCubit>(() => _i131.ItemsCubit(get<_i121.GetItems>()));
  gh.factory<_i132.JobsOffersCubit>(() => _i132.JobsOffersCubit(
      get<_i122.GetJobsOffers>(),
      get<_i94.AcceptJobOffer>(),
      get<_i112.DeclineJobOffer>()));
  gh.lazySingleton<_i133.LinkEmailAndPassword>(
      () => _i133.LinkEmailAndPassword(get<_i110.AuthRepository>()));
  gh.factory<_i134.LocationWidgetCubit>(
      () => _i134.LocationWidgetCubit(get<_i116.GetCurrentLocation>()));
  gh.lazySingleton<_i135.LogOut>(
      () => _i135.LogOut(get<_i110.AuthRepository>()));
  gh.factory<_i136.NotificationsBloc>(
      () => _i136.NotificationsBloc(get<_i56.NotificationsRepository>()));
  gh.lazySingleton<_i137.PlaceOrder>(
      () => _i137.PlaceOrder(get<_i91.UserOrdersRepository>()));
  gh.lazySingleton<_i138.RemoveAddress>(
      () => _i138.RemoveAddress(get<_i104.AddressesRepository>()));
  gh.factory<_i139.SelectLocationMapBloc>(
      () => _i139.SelectLocationMapBloc(get<_i116.GetCurrentLocation>()));
  gh.lazySingleton<_i140.SignInWithPhone>(
      () => _i140.SignInWithPhone(get<_i110.AuthRepository>()));
  gh.lazySingleton<_i141.StartUpRepository>(() => _i142.StartUpRepositoryImpl(
      get<_i76.StartupRemoteApi>(), get<_i75.StartupLocalApi>()));
  gh.factory<_i143.UnitEntryBloc>(() => _i143.UnitEntryBloc(
      get<_i124.GetUnitSuggestions>(), get<_i103.AddUnitToReference>()));
  gh.lazySingleton<_i144.UpdateAddress>(
      () => _i144.UpdateAddress(get<_i104.AddressesRepository>()));
  gh.lazySingleton<_i145.UpdateMainAddress>(
      () => _i145.UpdateMainAddress(get<_i104.AddressesRepository>()));
  gh.lazySingleton<_i146.UserInstitutionsRepository>(() =>
      _i147.UserInstitutionsRepositoryImpl(
          get<_i89.UserInstitutionsServiceApi>(), get<_i41.NetworkInfo>()));
  gh.factory<_i148.UserOrdersBloc>(() => _i148.UserOrdersBloc(
      get<_i125.GetUserOrders>(), get<_i85.UpdateInstitutionOrder>()));
  gh.lazySingleton<_i149.VerifyPhoneNumber>(
      () => _i149.VerifyPhoneNumber(get<_i110.AuthRepository>()));
  gh.lazySingleton<_i150.WorkInstitutionRepository>(() =>
      _i151.WorkInstitutionRepositoryImpl(
          get<_i93.WorkIstitutionsApiService>(), get<_i17.NetworkInfo>()));
  gh.lazySingleton<_i152.AddAddress>(
      () => _i152.AddAddress(get<_i104.AddressesRepository>()));
  gh.factory<_i153.AddEditAddressCubit>(() => _i153.AddEditAddressCubit(
      get<_i154.AddAddress>(),
      get<_i154.UpdateAddress>(),
      get<_i145.UpdateMainAddress>()));
  gh.factory<_i155.AddEmailVerificationCubit>(() =>
      _i155.AddEmailVerificationCubit(
          get<_i133.LinkEmailAndPassword>(), get<_i74.SmsAutoFill>()));
  gh.lazySingleton<_i156.AddFirstAddress>(
      () => _i156.AddFirstAddress(get<_i104.AddressesRepository>()));
  gh.lazySingleton<_i157.AddFirstAddressCubit>(
      () => _i157.AddFirstAddressCubit(get<_i156.AddFirstAddress>()));
  gh.lazySingleton<_i158.AddInstitution>(
      () => _i158.AddInstitution(get<_i146.UserInstitutionsRepository>()));
  gh.factory<_i159.AddInstitutionCubit>(
      () => _i159.AddInstitutionCubit(get<_i158.AddInstitution>()));
  gh.factory<_i160.AddItemBloc>(() => _i160.AddItemBloc(
      get<_i72.SearchItem>(),
      get<_i97.AddInstitutionItem>(),
      get<_i102.AddRefAndInstitutionItem>(),
      get<_i84.UpdateInstitutionItem>()));
  gh.factory<_i161.AddressesCubit>(
      () => _i161.AddressesCubit(get<_i115.GetAddresses>()));
  gh.factory<_i162.AppBloc>(
      () => _i162.AppBloc(authRepository: get<_i110.AuthRepository>()));
  gh.lazySingleton<_i163.CheckIfSeenBefore>(
      () => _i163.CheckIfSeenBefore(get<_i141.StartUpRepository>()));
  gh.factory<_i164.ClientInstitutionsCubit>(() => _i164.ClientInstitutionsCubit(
      get<_i26.GetClientInstitutionItems>(), get<_i137.PlaceOrder>()));
  gh.factory<_i165.EmployeesCubit>(() => _i165.EmployeesCubit(
      get<_i117.GetEmployees>(), get<_i70.RemoveEmployee>()));
  gh.lazySingleton<_i166.GetUserInstitutions>(
      () => _i166.GetUserInstitutions(get<_i146.UserInstitutionsRepository>()));
  gh.lazySingleton<_i167.GetWorkInstitutions>(
      () => _i167.GetWorkInstitutions(get<_i150.WorkInstitutionRepository>()));
  gh.factory<_i168.LinkEmailAndPasswordCubit>(
      () => _i168.LinkEmailAndPasswordCubit(get<_i149.VerifyPhoneNumber>()));
  gh.lazySingleton<_i169.NeedsAForcedUpdate>(
      () => _i169.NeedsAForcedUpdate(get<_i141.StartUpRepository>()));
  gh.factory<_i170.StartUpCubit>(() => _i170.StartUpCubit(
      get<_i169.NeedsAForcedUpdate>(), get<_i163.CheckIfSeenBefore>()));
  gh.lazySingleton<_i171.UpdateInstitution>(
      () => _i171.UpdateInstitution(get<_i146.UserInstitutionsRepository>()));
  gh.factory<_i172.UpdatePhoneCubit>(
      () => _i172.UpdatePhoneCubit(get<_i149.VerifyPhoneNumber>()));
  gh.factory<_i173.UserInstitutionsCubit>(
      () => _i173.UserInstitutionsCubit(get<_i166.GetUserInstitutions>()));
  gh.factory<_i174.WorkInstitutionsCubit>(
      () => _i174.WorkInstitutionsCubit(get<_i167.GetWorkInstitutions>()));
  return get;
}

class _$RegisterModule extends _i175.RegisterModule {}
