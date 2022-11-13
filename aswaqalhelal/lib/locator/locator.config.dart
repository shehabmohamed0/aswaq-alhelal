// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i11;
import 'package:cloud_functions/cloud_functions.dart' as _i12;
import 'package:firebase_auth/firebase_auth.dart' as _i10;
import 'package:firebase_messaging/firebase_messaging.dart' as _i13;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i14;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i15;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i21;
import 'package:localstorage/localstorage.dart' as _i26;
import 'package:location/location.dart' as _i27;
import 'package:shared_preferences/shared_preferences.dart' as _i46;
import 'package:sms_autofill/sms_autofill.dart' as _i47;

import '../core/locale/locale_cubit.dart' as _i105;
import '../core/params/services/cache_client.dart' as _i4;
import '../core/params/services/network_info.dart' as _i28;
import '../core/services/firebase_notification_service.dart' as _i30;
import '../core/services/notification_service.dart' as _i29;
import '../features/address/data/datasources/address_local_data_source.dart'
    as _i3;
import '../features/address/data/datasources/addresses_service_api.dart'
    as _i68;
import '../features/address/data/repositories/addresses_repository_impl.dart'
    as _i136;
import '../features/address/domain/repositories/addresses_repository.dart'
    as _i135;
import '../features/address/domain/usecases/add_address.dart' as _i172;
import '../features/address/domain/usecases/add_first_address.dart' as _i175;
import '../features/address/domain/usecases/get_addresses.dart' as _i144;
import '../features/address/domain/usecases/get_current_location.dart' as _i145;
import '../features/address/domain/usecases/remove_address.dart' as _i164;
import '../features/address/domain/usecases/update_address.dart' as _i167;
import '../features/address/domain/usecases/update_main_address.dart' as _i169;
import '../features/address/domain/usecases/usecases.dart' as _i174;
import '../features/address/presentation/bloc/select_location_map/select_location_map_bloc.dart'
    as _i165;
import '../features/address/presentation/cubit/add_edit_address/add_edit_address_cubit.dart'
    as _i173;
import '../features/address/presentation/cubit/add_first_address/add_first_address_cubit.dart'
    as _i176;
import '../features/address/presentation/cubit/addresses/addresses_cubit.dart'
    as _i178;
import '../features/address_suggestions/data/datasources/address_suggestions_api_service.dart'
    as _i65;
import '../features/address_suggestions/data/repositories/address_suggestions_repository_impl.dart'
    as _i67;
import '../features/address_suggestions/domain/repositories/address_suggestions_repository.dart'
    as _i66;
import '../features/address_suggestions/domain/usecases/add_new_city.dart'
    as _i131;
import '../features/address_suggestions/domain/usecases/add_new_governate.dart'
    as _i132;
import '../features/address_suggestions/domain/usecases/add_new_neighborhood.dart'
    as _i133;
import '../features/address_suggestions/domain/usecases/get_cities_suggetsions.dart'
    as _i79;
import '../features/address_suggestions/domain/usecases/get_districts_suggestions.dart'
    as _i84;
import '../features/address_suggestions/domain/usecases/get_governates_suggestions.dart'
    as _i83;
import '../features/address_suggestions/domain/usecases/usecases.dart' as _i6;
import '../features/address_suggestions/presentation/bloc/address_suggestions_bloc.dart'
    as _i5;
import '../features/address_suggestions/presentation/cubit/location_widget/location_widget_cubit.dart'
    as _i162;
import '../features/auth/data/datasources/local/auth_local_service.dart'
    as _i70;
import '../features/auth/data/datasources/remote/auth_api_service.dart' as _i69;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i72;
import '../features/auth/domain/repositories/auth_repository.dart' as _i71;
import '../features/auth/domain/usecases/link_email_and_password.dart' as _i104;
import '../features/auth/domain/usecases/log_out.dart' as _i106;
import '../features/auth/domain/usecases/sign_in_with_phone.dart' as _i110;
import '../features/auth/domain/usecases/usecases.dart' as _i35;
import '../features/auth/domain/usecases/verify_phone_number.dart' as _i120;
import '../features/auth/presentation/bloc/app_status/app_bloc.dart' as _i137;
import '../features/auth/presentation/bloc/sign_in/phone_sign_in_form_cubit.dart'
    as _i34;
import '../features/cart/presentation/cubit/institution_cart/institution_cart_cubit.dart'
    as _i16;
import '../features/cart/presentation/cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart'
    as _i22;
import '../features/client_home_institutions/data/datasources/institutions_api_service.dart'
    as _i20;
import '../features/client_home_institutions/data/repositories/institutions_repository_impl.dart'
    as _i96;
import '../features/client_home_institutions/domain/repositories/institutions_repository.dart'
    as _i95;
import '../features/client_home_institutions/domain/usecases/get_institutions.dart'
    as _i143;
import '../features/client_home_institutions/presentation/cubit/institutions_cubit.dart'
    as _i158;
import '../features/client_institution/data/datasources/client_institution_items_api.dart'
    as _i73;
import '../features/client_institution/data/repositories/client_institution_repository_impl.dart'
    as _i75;
import '../features/client_institution/domain/repositories/client_institution_repository.dart'
    as _i74;
import '../features/client_institution/domain/usecases/get_client_institution_item.dart'
    as _i80;
import '../features/client_institution/presentation/cubit/client_institution/client_institution_cubit.dart'
    as _i139;
import '../features/distribution_areas/data/datasources/distribution_area_api_service.dart'
    as _i76;
import '../features/distribution_areas/data/repositories/distribution_areas_repository_impl.dart'
    as _i78;
import '../features/distribution_areas/domain/repositories/distribution_area_repository.dart'
    as _i77;
import '../features/distribution_areas/domain/usecases/add_distribution_area.dart'
    as _i124;
import '../features/distribution_areas/domain/usecases/delete_distribution_area.dart'
    as _i141;
import '../features/distribution_areas/domain/usecases/get_distribution_areas.dart'
    as _i81;
import '../features/distribution_areas/domain/usecases/update_distribution_area.dart'
    as _i114;
import '../features/distribution_areas/domain/usecases/usecases.dart' as _i8;
import '../features/distribution_areas/presentation/bloc/distribution_areas_bloc.dart'
    as _i7;
import '../features/home/data/datasources/items_api_servic.dart' as _i24;
import '../features/home/data/repositories/items_repository_impl.dart' as _i99;
import '../features/home/domain/repositories/items_repository.dart' as _i98;
import '../features/home/domain/usecases/get_items.dart' as _i149;
import '../features/home/presentation/cubit/items/items_cubit.dart' as _i159;
import '../features/institution_clients/data/datasources/institution_clients_api_service.dart'
    as _i17;
import '../features/institution_clients/data/repositories/institution_clients_repository_impl.dart'
    as _i89;
import '../features/institution_clients/domain/repositories/institution_clients_repository.dart'
    as _i88;
import '../features/institution_clients/domain/usecases/add_institution_clinet.dart'
    as _i127;
import '../features/institution_clients/domain/usecases/get_user_by_phone_number.dart'
    as _i151;
import '../features/institution_clients/presentation/bloc/institution_clients_bloc.dart'
    as _i154;
import '../features/institution_items/data/datasources/items_api_service.dart'
    as _i23;
import '../features/institution_items/data/datasources/units_api_service.dart'
    as _i50;
import '../features/institution_items/data/repositories/items_repository_impl.dart'
    as _i101;
import '../features/institution_items/data/repositories/units_repository_impl.dart'
    as _i52;
import '../features/institution_items/domain/repositories/items_repository.dart'
    as _i100;
import '../features/institution_items/domain/repositories/units_repository.dart'
    as _i51;
import '../features/institution_items/domain/usecases/add_instition_item.dart'
    as _i129;
import '../features/institution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i134;
import '../features/institution_items/domain/usecases/add_unit_to_reference.dart'
    as _i64;
import '../features/institution_items/domain/usecases/get_institution_items.dart'
    as _i146;
import '../features/institution_items/domain/usecases/get_unit_suggestions.dart'
    as _i86;
import '../features/institution_items/domain/usecases/search_item.dart'
    as _i109;
import '../features/institution_items/domain/usecases/update_institution_item.dart'
    as _i115;
import '../features/institution_items/presentation/bloc/add_item/add_item_bloc.dart'
    as _i177;
import '../features/institution_items/presentation/bloc/item_units/units_bloc.dart'
    as _i97;
import '../features/institution_items/presentation/bloc/unit_entry/unit_entry_bloc.dart'
    as _i113;
import '../features/institution_items/presentation/cubit/institution_items/institution_items_cubit.dart'
    as _i155;
import '../features/institution_receipts/data/datasources/institution_receipts_api_service.dart'
    as _i19;
import '../features/institution_receipts/data/repositories/institution_receipts_repository_impl.dart'
    as _i94;
import '../features/institution_receipts/domain/repositories/institution_receipts_repository.dart'
    as _i93;
import '../features/institution_receipts/domain/usecases/add_institution_receipts.dart'
    as _i130;
import '../features/institution_receipts/domain/usecases/get_institution_receipts.dart'
    as _i148;
import '../features/institution_receipts/presentation/cubit/institution_receipts_cubit.dart'
    as _i157;
import '../features/jobs_offers/data/datasources/jobs_offers_api_service.dart'
    as _i25;
import '../features/jobs_offers/data/repositories/jobs_offers_repository_impl.dart'
    as _i103;
import '../features/jobs_offers/domain/repositories/jobs_offers_repository.dart'
    as _i102;
import '../features/jobs_offers/domain/usecases/accept_job_offer.dart' as _i123;
import '../features/jobs_offers/domain/usecases/decline_job_offer.dart'
    as _i140;
import '../features/jobs_offers/domain/usecases/get_jobs_offers.dart' as _i150;
import '../features/jobs_offers/presentation/cubit/jobs_offers_cubit.dart'
    as _i160;
import '../features/notifications/data/datasources/notifications_remote_api.dart'
    as _i31;
import '../features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i33;
import '../features/notifications/domain/repositories/notifications_repository.dart'
    as _i32;
import '../features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i107;
import '../features/orders/data/datasources/institution_orders_api_service.dart'
    as _i18;
import '../features/orders/data/datasources/user_orders_api_service.dart'
    as _i59;
import '../features/orders/data/repositories/institution_orders_repository_impl.dart'
    as _i92;
import '../features/orders/data/repositories/user_orders_repository_impl.dart'
    as _i61;
import '../features/orders/domain/repositories/institution_orders_repository.dart'
    as _i91;
import '../features/orders/domain/repositories/user_orders_repository.dart'
    as _i60;
import '../features/orders/domain/usecases/get_institution_orders.dart'
    as _i147;
import '../features/orders/domain/usecases/get_user_orders.dart' as _i87;
import '../features/orders/domain/usecases/place_order.dart' as _i108;
import '../features/orders/domain/usecases/update_institution_order.dart'
    as _i116;
import '../features/orders/presentation/cubit/cubit/institution_orders_cubit.dart'
    as _i156;
import '../features/orders/presentation/cubit/user_orders/user_orders_bloc.dart'
    as _i119;
import '../features/owner_institutions/data/datasources/user_institutions_service_api.dart'
    as _i58;
import '../features/owner_institutions/data/repositories/institutions_repository_impl.dart'
    as _i118;
import '../features/owner_institutions/domain/repositories/institutions_repository.dart'
    as _i117;
import '../features/owner_institutions/domain/usecases/add_institution.dart'
    as _i126;
import '../features/owner_institutions/domain/usecases/get_user_institutions.dart'
    as _i152;
import '../features/owner_institutions/domain/usecases/update_institution.dart'
    as _i168;
import '../features/owner_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i128;
import '../features/recruitment/data/datasources/recruitment_api_service.dart'
    as _i39;
import '../features/recruitment/data/repositories/recruitment_repository_impl.dart'
    as _i42;
import '../features/recruitment/domain/repositories/recruitment_repository.dart'
    as _i41;
import '../features/recruitment/domain/usecases/get_employees.dart' as _i82;
import '../features/recruitment/domain/usecases/get_sent_job_offers.dart'
    as _i85;
import '../features/recruitment/domain/usecases/remove_employee.dart' as _i43;
import '../features/recruitment/domain/usecases/remove_job_offer.dart' as _i44;
import '../features/recruitment/domain/usecases/send_job_offer.dart' as _i45;
import '../features/recruitment/presentation/cubit/employees/employees_cubit.dart'
    as _i142;
import '../features/recruitment/presentation/cubit/job_offers/send_job_offers_cubit.dart'
    as _i90;
import '../features/recruitment/presentation/cubit/recruitment/recruitment_cubit.dart'
    as _i40;
import '../features/settings/data/datasources/profile_api_service.dart' as _i36;
import '../features/settings/data/repositories/profile_repository_impl.dart'
    as _i38;
import '../features/settings/domain/repositories/profile_repository.dart'
    as _i37;
import '../features/settings/domain/usecases/update_email.dart' as _i53;
import '../features/settings/domain/usecases/update_phone_number.dart' as _i55;
import '../features/settings/domain/usecases/update_profile.dart' as _i57;
import '../features/settings/presentation/bloc/account_info/account_info_cubit.dart'
    as _i63;
import '../features/settings/presentation/bloc/add_email/add_email_cubit.dart'
    as _i161;
import '../features/settings/presentation/bloc/add_email/add_email_verification_cubit.dart'
    as _i125;
import '../features/settings/presentation/bloc/change_phone/update_phone_cubit.dart'
    as _i170;
import '../features/settings/presentation/bloc/change_phone/update_phone_verification_cubit.dart'
    as _i56;
import '../features/settings/presentation/bloc/cubit/update_email_cubit.dart'
    as _i54;
import '../features/start_up/data/datasources/startup_local_api.dart' as _i48;
import '../features/start_up/data/datasources/startup_remote_api.dart' as _i49;
import '../features/start_up/data/repositories/startup_repository_impl.dart'
    as _i112;
import '../features/start_up/domain/repositories/start_up_repository.dart'
    as _i111;
import '../features/start_up/domain/usecases/check_if_seen_before.dart'
    as _i138;
import '../features/start_up/domain/usecases/needs_a_forced_update.dart'
    as _i163;
import '../features/start_up/presentation/cubit/start_up/start_up_cubit.dart'
    as _i166;
import '../features/work_institutions/data/datasources/work_institution_api_service.dart'
    as _i62;
import '../features/work_institutions/data/repositories/work_institution_repository_impl.dart'
    as _i122;
import '../features/work_institutions/domain/usecases/get_work_institutions.dart'
    as _i153;
import '../features/work_institutions/domain/work_institution_repository.dart'
    as _i121;
import '../features/work_institutions/presentation/cubit/work_institutions_cubit.dart'
    as _i171;
import 'register_module.dart' as _i179; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AddressesLocalDataSource>(
      () => _i3.AddressesLocalDataSourceImpl());
  gh.lazySingleton<_i4.CacheClient>(() => _i4.CacheClient());
  gh.factory<_i5.CitiesSuggestionsBloc>(() => _i5.CitiesSuggestionsBloc(
        get<_i6.GetCitiesSuggestions>(),
        get<_i6.AddNewCity>(),
      ));
  gh.factory<_i7.DistributionAreasBloc>(() => _i7.DistributionAreasBloc(
        get<_i6.GetGovernatesSuggestions>(),
        get<_i6.GetCitiesSuggestions>(),
        get<_i6.GetNeighborhoodsSuggestions>(),
        get<_i6.AddNewGovernate>(),
        get<_i6.AddNewCity>(),
        get<_i6.AddNewNeighborhood>(),
        get<_i8.GetDistributionAreas>(),
        get<_i8.AddDistributionArea>(),
        get<_i8.UpdateDistributionArea>(),
        get<_i8.DeleteDistributionArea>(),
      ));
  gh.factory<_i9.FacebookAuth>(() => registerModule.facebookAuth);
  gh.factory<_i10.FirebaseAuth>(() => registerModule.auth);
  gh.factory<_i11.FirebaseFirestore>(() => registerModule.firestore);
  gh.factory<_i12.FirebaseFunctions>(() => registerModule.cloudFunctions);
  gh.factory<_i13.FirebaseMessaging>(() => registerModule.firebaseMessaging);
  gh.factory<_i14.FirebaseRemoteConfig>(() => registerModule.remoteConfig);
  gh.factory<_i15.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i5.GovernatesSuggestionsBloc>(() => _i5.GovernatesSuggestionsBloc(
        get<_i6.GetGovernatesSuggestions>(),
        get<_i6.AddNewGovernate>(),
      ));
  gh.factory<_i16.InstitutionCartCubit>(() => _i16.InstitutionCartCubit());
  gh.lazySingleton<_i17.InstitutionClientsApiService>(
      () => _i17.InstitutionClientsApiServiceImpl(
            get<_i11.FirebaseFirestore>(),
            get<_i12.FirebaseFunctions>(),
          ));
  gh.lazySingleton<_i18.InstitutionOrdersApiService>(() =>
      _i18.InstitutionOrdersApiServiceImpl(get<_i11.FirebaseFirestore>()));
  gh.lazySingleton<_i19.InstitutionReceiptsApiService>(() =>
      _i19.InstitutionReceiptsApiServiceImpl(get<_i11.FirebaseFirestore>()));
  gh.lazySingleton<_i20.InstitutionsApiService>(
      () => _i20.InstitutionsApiServiceImpl(get<_i11.FirebaseFirestore>()));
  gh.factory<_i21.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.factory<_i22.ItemAddToCartDialogCubit>(
      () => _i22.ItemAddToCartDialogCubit());
  gh.lazySingleton<_i23.ItemsApiService>(() => _i23.ItemsApiServiceImpl(
        get<_i10.FirebaseAuth>(),
        get<_i11.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i24.ItemsApiService2>(
      () => _i24.ItemsApiServiceImpl(get<_i11.FirebaseFirestore>()));
  gh.lazySingleton<_i25.JobsOffersApiService>(
      () => _i25.JobsOffersApiServiceImpl(get<_i11.FirebaseFirestore>()));
  await gh.factoryAsync<_i26.LocalStorage>(
    () => registerModule.localStorage,
    preResolve: true,
  );
  gh.factory<_i27.Location>(() => registerModule.location);
  gh.factory<_i5.NeighborhoodsSuggestionsBloc>(
      () => _i5.NeighborhoodsSuggestionsBloc(
            get<_i6.GetNeighborhoodsSuggestions>(),
            get<_i6.AddNewNeighborhood>(),
          ));
  gh.lazySingleton<_i28.NetworkInfo>(
      () => _i28.NetworkInfoImpl(get<_i21.InternetConnectionChecker>()));
  gh.lazySingleton<_i29.NotificationService>(
      () => _i30.FirebaseNotificationService());
  gh.lazySingleton<_i31.NotificationsApiService>(
      () => _i31.NotificationsApiServiceImpl(
            get<_i11.FirebaseFirestore>(),
            get<_i10.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i32.NotificationsRepository>(
      () => _i33.NotificationsRepositoryImpl(
            get<_i31.NotificationsApiService>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.factory<_i34.PhoneSignInFormCubit>(() => _i34.PhoneSignInFormCubit(
        get<_i35.VerifyPhoneNumber>(),
        get<_i35.SignInWithPhone>(),
      ));
  gh.lazySingleton<_i36.ProfileApiService>(() => _i36.ProfileApiServiceImpl(
        get<_i10.FirebaseAuth>(),
        get<_i11.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i37.ProfileRepository>(() => _i38.ProfileRepositoryImpl(
        get<_i36.ProfileApiService>(),
        get<_i28.NetworkInfo>(),
      ));
  gh.lazySingleton<_i39.RecruitmentApiService>(
      () => _i39.RecruitmentApiServiceImpl(
            get<_i11.FirebaseFirestore>(),
            get<_i12.FirebaseFunctions>(),
          ));
  gh.factory<_i40.RecruitmentCubit>(() => _i40.RecruitmentCubit());
  gh.lazySingleton<_i41.RecruitmentRepository>(
      () => _i42.RecruitmentRepositoryImpl(
            get<_i39.RecruitmentApiService>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingleton<_i43.RemoveEmployee>(
      () => _i43.RemoveEmployee(get<_i41.RecruitmentRepository>()));
  gh.lazySingleton<_i44.RemoveJobOffer>(
      () => _i44.RemoveJobOffer(get<_i41.RecruitmentRepository>()));
  gh.lazySingleton<_i45.SendJobOffer>(
      () => _i45.SendJobOffer(get<_i41.RecruitmentRepository>()));
  await gh.factoryAsync<_i46.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i47.SmsAutoFill>(() => registerModule.smsAutoFill);
  gh.lazySingleton<_i48.StartupLocalApi>(
      () => _i48.StartUpLocalApiImpl(get<_i46.SharedPreferences>()));
  gh.lazySingleton<_i49.StartupRemoteApi>(
      () => _i49.StartupRemoteApiImpl(get<_i14.FirebaseRemoteConfig>()));
  gh.lazySingleton<_i50.UnitsApiService>(
      () => _i50.UnitsApiServiceImpl(get<_i11.FirebaseFirestore>()));
  gh.lazySingleton<_i51.UnitsRepository>(() => _i52.UnitsRepositoryImpl(
        get<_i28.NetworkInfo>(),
        get<_i50.UnitsApiService>(),
      ));
  gh.lazySingleton<_i53.UpdateEmail>(
      () => _i53.UpdateEmail(get<_i37.ProfileRepository>()));
  gh.factory<_i54.UpdateEmailCubit>(
      () => _i54.UpdateEmailCubit(get<_i53.UpdateEmail>()));
  gh.lazySingleton<_i55.UpdatePhoneNumber>(
      () => _i55.UpdatePhoneNumber(get<_i37.ProfileRepository>()));
  gh.factory<_i56.UpdatePhoneVerificationCubit>(
      () => _i56.UpdatePhoneVerificationCubit(
            get<_i55.UpdatePhoneNumber>(),
            get<_i47.SmsAutoFill>(),
          ));
  gh.lazySingleton<_i57.UpdateProfile>(
      () => _i57.UpdateProfile(get<_i37.ProfileRepository>()));
  gh.lazySingleton<_i58.UserInstitutionsServiceApi>(
      () => _i58.UserInstitutionsServiceApiImpl(
            get<_i10.FirebaseAuth>(),
            get<_i11.FirebaseFirestore>(),
          ));
  gh.lazySingleton<_i59.UserOrdersApiService>(
      () => _i59.UserOrdersApiServiceImpl(get<_i11.FirebaseFirestore>()));
  gh.lazySingleton<_i60.UserOrdersRepository>(
      () => _i61.UserOrdersRepositoryImpl(
            get<_i59.UserOrdersApiService>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingleton<_i62.WorkIstitutionsApiService>(
      () => _i62.WorkIstitutionsApiServiceImpl(get<_i11.FirebaseFirestore>()));
  gh.factory<_i63.AccountInfoCubit>(
      () => _i63.AccountInfoCubit(get<_i57.UpdateProfile>()));
  gh.lazySingleton<_i64.AddUnitToReference>(
      () => _i64.AddUnitToReference(get<_i51.UnitsRepository>()));
  gh.lazySingleton<_i65.AddressSuggestionsApiService>(() =>
      _i65.AddressSuggestionsApiServiceImpl(get<_i11.FirebaseFirestore>()));
  gh.lazySingleton<_i66.AddressSuggestionsRepository>(() =>
      _i67.AddressSuggestionsRepositoryImpl(
          get<_i65.AddressSuggestionsApiService>()));
  gh.lazySingleton<_i68.AddressesServiceApi>(() => _i68.AddressesServiceApiImpl(
        get<_i10.FirebaseAuth>(),
        get<_i11.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i69.AuthApiService>(() => _i69.AuthApiServiceImpl(
        firebaseAuth: get<_i10.FirebaseAuth>(),
        googleSignIn: get<_i15.GoogleSignIn>(),
        facebookAuth: get<_i9.FacebookAuth>(),
        firestore: get<_i11.FirebaseFirestore>(),
        cloudFunctions: get<_i12.FirebaseFunctions>(),
        firebaseMessaging: get<_i13.FirebaseMessaging>(),
        sharedPreferences: get<_i46.SharedPreferences>(),
      ));
  gh.lazySingleton<_i70.AuthLocalService>(
      () => _i70.AuthLocalServiceImpl(get<_i46.SharedPreferences>()));
  gh.lazySingleton<_i71.AuthRepository>(() => _i72.AuthRepositoryImpl(
        authApiService: get<_i69.AuthApiService>(),
        authLocalService: get<_i70.AuthLocalService>(),
        networkInfo: get<_i28.NetworkInfo>(),
      ));
  gh.lazySingleton<_i73.ClientInstitutionItemsApi>(
      () => _i73.ClientInstitutionItemsApiImpl(get<_i11.FirebaseFirestore>()));
  gh.lazySingleton<_i74.ClientInstitutionRepository>(
      () => _i75.ClientInstitutionRepositoryImpl(
            get<_i73.ClientInstitutionItemsApi>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingleton<_i76.DistributionAreaApiService>(
      () => _i76.DistributionAreaApiServiceImpl(get<_i11.FirebaseFirestore>()));
  gh.lazySingleton<_i77.DistributionAreasRepository>(
      () => _i78.DistributionAreasRepositoryImpl(
            get<_i76.DistributionAreaApiService>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingleton<_i79.GetCitiesSuggestions>(() =>
      _i79.GetCitiesSuggestions(get<_i66.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i80.GetClientInstitutionItems>(() =>
      _i80.GetClientInstitutionItems(get<_i74.ClientInstitutionRepository>()));
  gh.lazySingleton<_i81.GetDistributionAreas>(
      () => _i81.GetDistributionAreas(get<_i77.DistributionAreasRepository>()));
  gh.lazySingleton<_i82.GetEmployees>(
      () => _i82.GetEmployees(get<_i41.RecruitmentRepository>()));
  gh.lazySingleton<_i83.GetGovernatesSuggestions>(() =>
      _i83.GetGovernatesSuggestions(get<_i66.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i84.GetNeighborhoodsSuggestions>(() =>
      _i84.GetNeighborhoodsSuggestions(
          get<_i66.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i85.GetSentJobOffers>(
      () => _i85.GetSentJobOffers(get<_i41.RecruitmentRepository>()));
  gh.lazySingleton<_i86.GetUnitSuggestions>(
      () => _i86.GetUnitSuggestions(get<_i51.UnitsRepository>()));
  gh.lazySingleton<_i87.GetUserOrders>(
      () => _i87.GetUserOrders(get<_i60.UserOrdersRepository>()));
  gh.lazySingleton<_i88.InstitutionClientsRepository>(
      () => _i89.InstitutionClientsRepositoryImpl(
            get<_i17.InstitutionClientsApiService>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.factory<_i90.InstitutionJobsOffersCubit>(
      () => _i90.InstitutionJobsOffersCubit(
            get<_i85.GetSentJobOffers>(),
            get<_i45.SendJobOffer>(),
            get<_i44.RemoveJobOffer>(),
          ));
  gh.lazySingleton<_i91.InstitutionOrdersRepository>(
      () => _i92.InstitutionOrdersRepositoryImpl(
            get<_i18.InstitutionOrdersApiService>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingleton<_i93.InstitutionReceiptsRepository>(
      () => _i94.InstitutionReceiptsRepositoryImpl(
            get<_i19.InstitutionReceiptsApiService>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingleton<_i95.InstitutionsRepository>(
      () => _i96.InstitutionsRepositoryImpl(
            get<_i20.InstitutionsApiService>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.factory<_i97.ItemUnitsBloc>(() => _i97.ItemUnitsBloc(
        get<_i86.GetUnitSuggestions>(),
        get<_i64.AddUnitToReference>(),
      ));
  gh.lazySingleton<_i98.ItemsRepository>(() => _i99.ItemsRepositoryImpl(
        get<_i24.ItemsApiService2>(),
        get<_i28.NetworkInfo>(),
      ));
  gh.lazySingleton<_i100.ItemsRepository>(() => _i101.ItemsRepositoryImpl(
        get<_i23.ItemsApiService>(),
        get<_i28.NetworkInfo>(),
      ));
  gh.lazySingleton<_i102.JobsOffersRepository>(
      () => _i103.JobsOffersRepositoryImpl(
            get<_i25.JobsOffersApiService>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingleton<_i104.LinkEmailAndPassword>(
      () => _i104.LinkEmailAndPassword(get<_i71.AuthRepository>()));
  gh.factory<_i105.LocaleCubit>(
      () => _i105.LocaleCubit(get<_i46.SharedPreferences>()));
  gh.lazySingleton<_i106.LogOut>(
      () => _i106.LogOut(get<_i71.AuthRepository>()));
  gh.factory<_i107.NotificationsBloc>(
      () => _i107.NotificationsBloc(get<_i32.NotificationsRepository>()));
  gh.lazySingleton<_i108.PlaceOrder>(
      () => _i108.PlaceOrder(get<_i60.UserOrdersRepository>()));
  gh.lazySingleton<_i109.SearchItem>(
      () => _i109.SearchItem(get<_i100.ItemsRepository>()));
  gh.lazySingleton<_i110.SignInWithPhone>(
      () => _i110.SignInWithPhone(get<_i71.AuthRepository>()));
  gh.lazySingleton<_i111.StartUpRepository>(() => _i112.StartUpRepositoryImpl(
        get<_i49.StartupRemoteApi>(),
        get<_i48.StartupLocalApi>(),
      ));
  gh.factory<_i113.UnitEntryBloc>(() => _i113.UnitEntryBloc(
        get<_i86.GetUnitSuggestions>(),
        get<_i64.AddUnitToReference>(),
      ));
  gh.lazySingleton<_i114.UpdateDistributionArea>(() =>
      _i114.UpdateDistributionArea(get<_i77.DistributionAreasRepository>()));
  gh.lazySingleton<_i115.UpdateInstitutionItem>(
      () => _i115.UpdateInstitutionItem(get<_i100.ItemsRepository>()));
  gh.lazySingleton<_i116.UpdateInstitutionOrder>(() =>
      _i116.UpdateInstitutionOrder(get<_i91.InstitutionOrdersRepository>()));
  gh.lazySingleton<_i117.UserInstitutionsRepository>(
      () => _i118.UserInstitutionsRepositoryImpl(
            get<_i58.UserInstitutionsServiceApi>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.factory<_i119.UserOrdersBloc>(() => _i119.UserOrdersBloc(
        get<_i87.GetUserOrders>(),
        get<_i116.UpdateInstitutionOrder>(),
      ));
  gh.lazySingleton<_i120.VerifyPhoneNumber>(
      () => _i120.VerifyPhoneNumber(get<_i71.AuthRepository>()));
  gh.lazySingleton<_i121.WorkInstitutionRepository>(
      () => _i122.WorkInstitutionRepositoryImpl(
            get<_i62.WorkIstitutionsApiService>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingleton<_i123.AcceptJobOffer>(
      () => _i123.AcceptJobOffer(get<_i102.JobsOffersRepository>()));
  gh.lazySingleton<_i124.AddDistributionArea>(
      () => _i124.AddDistributionArea(get<_i77.DistributionAreasRepository>()));
  gh.factory<_i125.AddEmailVerificationCubit>(
      () => _i125.AddEmailVerificationCubit(
            get<_i104.LinkEmailAndPassword>(),
            get<_i47.SmsAutoFill>(),
          ));
  gh.lazySingleton<_i126.AddInstitution>(
      () => _i126.AddInstitution(get<_i117.UserInstitutionsRepository>()));
  gh.lazySingleton<_i127.AddInstitutionClient>(() =>
      _i127.AddInstitutionClient(get<_i88.InstitutionClientsRepository>()));
  gh.factory<_i128.AddInstitutionCubit>(
      () => _i128.AddInstitutionCubit(get<_i126.AddInstitution>()));
  gh.lazySingleton<_i129.AddInstitutionItem>(
      () => _i129.AddInstitutionItem(get<_i100.ItemsRepository>()));
  gh.lazySingleton<_i130.AddInstitutionReceipt>(() =>
      _i130.AddInstitutionReceipt(get<_i93.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i131.AddNewCity>(
      () => _i131.AddNewCity(get<_i66.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i132.AddNewGovernate>(
      () => _i132.AddNewGovernate(get<_i66.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i133.AddNewNeighborhood>(
      () => _i133.AddNewNeighborhood(get<_i66.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i134.AddRefAndInstitutionItem>(
      () => _i134.AddRefAndInstitutionItem(get<_i100.ItemsRepository>()));
  gh.lazySingleton<_i135.AddressesRepository>(
      () => _i136.AddressesRepositoryImpl(
            get<_i68.AddressesServiceApi>(),
            get<_i28.NetworkInfo>(),
            get<_i3.AddressesLocalDataSource>(),
          ));
  gh.factory<_i137.AppBloc>(
      () => _i137.AppBloc(authRepository: get<_i71.AuthRepository>()));
  gh.lazySingleton<_i138.CheckIfSeenBefore>(
      () => _i138.CheckIfSeenBefore(get<_i111.StartUpRepository>()));
  gh.factory<_i139.ClientInstitutionCubit>(() => _i139.ClientInstitutionCubit(
        get<_i80.GetClientInstitutionItems>(),
        get<_i108.PlaceOrder>(),
      ));
  gh.lazySingleton<_i140.DeclineJobOffer>(
      () => _i140.DeclineJobOffer(get<_i102.JobsOffersRepository>()));
  gh.lazySingleton<_i141.DeleteDistributionArea>(() =>
      _i141.DeleteDistributionArea(get<_i77.DistributionAreasRepository>()));
  gh.factory<_i142.EmployeesCubit>(() => _i142.EmployeesCubit(
        get<_i82.GetEmployees>(),
        get<_i43.RemoveEmployee>(),
      ));
  gh.lazySingleton<_i143.GetAddressInstitutions>(
      () => _i143.GetAddressInstitutions(get<_i95.InstitutionsRepository>()));
  gh.lazySingleton<_i144.GetAddresses>(
      () => _i144.GetAddresses(get<_i135.AddressesRepository>()));
  gh.lazySingleton<_i145.GetCurrentLocation>(
      () => _i145.GetCurrentLocation(get<_i135.AddressesRepository>()));
  gh.lazySingleton<_i146.GetInstitutionItems>(
      () => _i146.GetInstitutionItems(get<_i100.ItemsRepository>()));
  gh.lazySingleton<_i147.GetInstitutionOrders>(() =>
      _i147.GetInstitutionOrders(get<_i91.InstitutionOrdersRepository>()));
  gh.lazySingleton<_i148.GetInstitutionReceipts>(() =>
      _i148.GetInstitutionReceipts(get<_i93.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i149.GetItems>(
      () => _i149.GetItems(get<_i98.ItemsRepository>()));
  gh.lazySingleton<_i150.GetJobsOffers>(
      () => _i150.GetJobsOffers(get<_i102.JobsOffersRepository>()));
  gh.lazySingleton<_i151.GetUserByPhoneNumber>(() =>
      _i151.GetUserByPhoneNumber(get<_i88.InstitutionClientsRepository>()));
  gh.lazySingleton<_i152.GetUserInstitutions>(
      () => _i152.GetUserInstitutions(get<_i117.UserInstitutionsRepository>()));
  gh.lazySingleton<_i153.GetWorkInstitutions>(
      () => _i153.GetWorkInstitutions(get<_i121.WorkInstitutionRepository>()));
  gh.factory<_i154.InstitutionClientsBloc>(
      () => _i154.InstitutionClientsBloc(get<_i151.GetUserByPhoneNumber>()));
  gh.factory<_i155.InstitutionItemsCubit>(
      () => _i155.InstitutionItemsCubit(get<_i146.GetInstitutionItems>()));
  gh.factory<_i156.InstitutionOrdersCubit>(() => _i156.InstitutionOrdersCubit(
        get<_i147.GetInstitutionOrders>(),
        get<_i116.UpdateInstitutionOrder>(),
      ));
  gh.factory<_i157.InstitutionReceiptsCubit>(
      () => _i157.InstitutionReceiptsCubit(
            get<_i146.GetInstitutionItems>(),
            get<_i148.GetInstitutionReceipts>(),
            get<_i130.AddInstitutionReceipt>(),
          ));
  gh.factory<_i158.InstitutionsCubit>(
      () => _i158.InstitutionsCubit(get<_i143.GetAddressInstitutions>()));
  gh.factory<_i159.ItemsCubit>(() => _i159.ItemsCubit(get<_i149.GetItems>()));
  gh.factory<_i160.JobsOffersCubit>(() => _i160.JobsOffersCubit(
        get<_i150.GetJobsOffers>(),
        get<_i123.AcceptJobOffer>(),
        get<_i140.DeclineJobOffer>(),
      ));
  gh.factory<_i161.LinkEmailAndPasswordCubit>(
      () => _i161.LinkEmailAndPasswordCubit(get<_i120.VerifyPhoneNumber>()));
  gh.factory<_i162.LocationWidgetCubit>(
      () => _i162.LocationWidgetCubit(get<_i145.GetCurrentLocation>()));
  gh.lazySingleton<_i163.NeedsAForcedUpdate>(
      () => _i163.NeedsAForcedUpdate(get<_i111.StartUpRepository>()));
  gh.lazySingleton<_i164.RemoveAddress>(
      () => _i164.RemoveAddress(get<_i135.AddressesRepository>()));
  gh.factory<_i165.SelectLocationMapBloc>(
      () => _i165.SelectLocationMapBloc(get<_i145.GetCurrentLocation>()));
  gh.factory<_i166.StartUpCubit>(() => _i166.StartUpCubit(
        get<_i163.NeedsAForcedUpdate>(),
        get<_i138.CheckIfSeenBefore>(),
      ));
  gh.lazySingleton<_i167.UpdateAddress>(
      () => _i167.UpdateAddress(get<_i135.AddressesRepository>()));
  gh.lazySingleton<_i168.UpdateInstitution>(
      () => _i168.UpdateInstitution(get<_i117.UserInstitutionsRepository>()));
  gh.lazySingleton<_i169.UpdateMainAddress>(
      () => _i169.UpdateMainAddress(get<_i135.AddressesRepository>()));
  gh.factory<_i170.UpdatePhoneCubit>(
      () => _i170.UpdatePhoneCubit(get<_i120.VerifyPhoneNumber>()));
  gh.factory<_i171.WorkInstitutionsCubit>(
      () => _i171.WorkInstitutionsCubit(get<_i153.GetWorkInstitutions>()));
  gh.lazySingleton<_i172.AddAddress>(
      () => _i172.AddAddress(get<_i135.AddressesRepository>()));
  gh.factory<_i173.AddEditAddressCubit>(() => _i173.AddEditAddressCubit(
        get<_i174.AddAddress>(),
        get<_i174.UpdateAddress>(),
        get<_i169.UpdateMainAddress>(),
      ));
  gh.lazySingleton<_i175.AddFirstAddress>(
      () => _i175.AddFirstAddress(get<_i135.AddressesRepository>()));
  gh.lazySingleton<_i176.AddFirstAddressCubit>(
      () => _i176.AddFirstAddressCubit(get<_i175.AddFirstAddress>()));
  gh.factory<_i177.AddItemBloc>(() => _i177.AddItemBloc(
        get<_i109.SearchItem>(),
        get<_i129.AddInstitutionItem>(),
        get<_i134.AddRefAndInstitutionItem>(),
        get<_i115.UpdateInstitutionItem>(),
      ));
  gh.factory<_i178.AddressesCubit>(
      () => _i178.AddressesCubit(get<_i144.GetAddresses>()));
  return get;
}

class _$RegisterModule extends _i179.RegisterModule {}
