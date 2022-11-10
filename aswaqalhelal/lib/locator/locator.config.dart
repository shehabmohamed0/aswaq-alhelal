// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i109;
import 'package:cloud_functions/cloud_functions.dart' as _i110;
import 'package:firebase_auth/firebase_auth.dart' as _i106;
import 'package:firebase_messaging/firebase_messaging.dart' as _i24;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i108;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i107;
import 'package:injectable/injectable.dart' as _i2;
import 'package:localstorage/localstorage.dart' as _i53;
import 'package:root_package/core/services/network_info.dart' as _i17;
import 'package:root_package/packages/cloud_firestore.dart' as _i4;
import 'package:root_package/packages/cloud_functions.dart' as _i65;
import 'package:root_package/packages/firebase_auth.dart' as _i9;
import 'package:root_package/packages/firebase_remote_config.dart' as _i76;
import 'package:root_package/packages/flutter_facebook_auth.dart' as _i23;
import 'package:root_package/packages/google_sign_in.dart' as _i30;
import 'package:root_package/packages/shared_preferences.dart' as _i11;
import 'package:root_package/root_package.dart' as _i42;
import 'package:sms_autofill/sms_autofill.dart' as _i73;

import '../core/services/firebase_notification_service.dart' as _i55;
import '../core/services/notification_service.dart' as _i54;
import '../features/address/data/datasources/address_local_data_source.dart'
    as _i7;
import '../features/address/data/datasources/addresses_service_api.dart' as _i8;
import '../features/address/data/repositories/addresses_repository_impl.dart'
    as _i104;
import '../features/address/domain/repositories/addresses_repository.dart'
    as _i103;
import '../features/address/domain/usecases/add_address.dart' as _i154;
import '../features/address/domain/usecases/add_first_address.dart' as _i158;
import '../features/address/domain/usecases/get_addresses.dart' as _i116;
import '../features/address/domain/usecases/get_current_location.dart' as _i117;
import '../features/address/domain/usecases/remove_address.dart' as _i140;
import '../features/address/domain/usecases/update_address.dart' as _i146;
import '../features/address/domain/usecases/update_main_address.dart' as _i147;
import '../features/address/domain/usecases/usecases.dart' as _i156;
import '../features/address/presentation/bloc/select_location_map/select_location_map_bloc.dart'
    as _i141;
import '../features/address/presentation/cubit/add_edit_address/add_edit_address_cubit.dart'
    as _i155;
import '../features/address/presentation/cubit/add_first_address/add_first_address_cubit.dart'
    as _i159;
import '../features/address/presentation/cubit/addresses/addresses_cubit.dart'
    as _i163;
import '../features/address_suggestions/data/datasources/address_suggestions_api_service.dart'
    as _i3;
import '../features/address_suggestions/data/repositories/address_suggestions_repository_impl.dart'
    as _i6;
import '../features/address_suggestions/domain/repositories/address_suggestions_repository.dart'
    as _i5;
import '../features/address_suggestions/domain/usecases/add_new_city.dart'
    as _i98;
import '../features/address_suggestions/domain/usecases/add_new_governate.dart'
    as _i99;
import '../features/address_suggestions/domain/usecases/add_new_neighborhood.dart'
    as _i100;
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
    as _i136;
import '../features/auth/data/datasources/local/auth_local_service.dart'
    as _i10;
import '../features/auth/data/datasources/remote/auth_api_service.dart'
    as _i105;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i112;
import '../features/auth/domain/repositories/auth_repository.dart' as _i111;
import '../features/auth/domain/usecases/link_email_and_password.dart' as _i135;
import '../features/auth/domain/usecases/log_out.dart' as _i137;
import '../features/auth/domain/usecases/sign_in_with_phone.dart' as _i142;
import '../features/auth/domain/usecases/usecases.dart' as _i60;
import '../features/auth/domain/usecases/verify_phone_number.dart' as _i151;
import '../features/auth/presentation/bloc/app_status/app_bloc.dart' as _i164;
import '../features/auth/presentation/bloc/sign_in/phone_sign_in_form_cubit.dart'
    as _i59;
import '../features/cart/presentation/cubit/institution_cart/institution_cart_cubit.dart'
    as _i31;
import '../features/cart/presentation/cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart'
    as _i43;
import '../features/client_home_institutions/data/datasources/institutions_api_service.dart'
    as _i39;
import '../features/client_home_institutions/data/repositories/institutions_repository_impl.dart'
    as _i41;
import '../features/client_home_institutions/domain/repositories/institutions_repository.dart'
    as _i40;
import '../features/client_home_institutions/domain/usecases/get_institutions.dart'
    as _i115;
import '../features/client_home_institutions/presentation/cubit/institutions_cubit.dart'
    as _i131;
import '../features/client_institution/data/datasources/client_institution_items_api.dart'
    as _i14;
import '../features/client_institution/data/repositories/client_institution_repository_impl.dart'
    as _i16;
import '../features/client_institution/domain/repositories/client_institution_repository.dart'
    as _i15;
import '../features/client_institution/domain/usecases/get_client_institution_item.dart'
    as _i26;
import '../features/client_institution/presentation/cubit/client_institution/client_institution_cubit.dart'
    as _i166;
import '../features/distribution_areas/data/datasources/distribution_area_api_service.dart'
    as _i18;
import '../features/distribution_areas/data/repositories/distribution_areas_repository_impl.dart'
    as _i22;
import '../features/distribution_areas/domain/repositories/distribution_area_repository.dart'
    as _i21;
import '../features/distribution_areas/domain/usecases/add_distribution_area.dart'
    as _i95;
import '../features/distribution_areas/domain/usecases/delete_distribution_area.dart'
    as _i114;
import '../features/distribution_areas/domain/usecases/get_distribution_areas.dart'
    as _i27;
import '../features/distribution_areas/domain/usecases/update_distribution_area.dart'
    as _i80;
import '../features/distribution_areas/domain/usecases/usecases.dart' as _i20;
import '../features/distribution_areas/presentation/bloc/distribution_areas_bloc.dart'
    as _i19;
import '../features/home/data/datasources/items_api_servic.dart' as _i45;
import '../features/home/data/repositories/items_repository_impl.dart' as _i47;
import '../features/home/domain/repositories/items_repository.dart' as _i46;
import '../features/home/domain/usecases/get_items.dart' as _i122;
import '../features/home/presentation/cubit/items/items_cubit.dart' as _i133;
import '../features/institution_clients/data/datasources/institution_clients_api_service.dart'
    as _i32;
import '../features/institution_items/data/datasources/items_api_service.dart'
    as _i44;
import '../features/institution_items/data/datasources/units_api_service.dart'
    as _i77;
import '../features/institution_items/data/repositories/items_repository_impl.dart'
    as _i49;
import '../features/institution_items/data/repositories/units_repository_impl.dart'
    as _i79;
import '../features/institution_items/domain/repositories/items_repository.dart'
    as _i48;
import '../features/institution_items/domain/repositories/units_repository.dart'
    as _i78;
import '../features/institution_items/domain/usecases/add_instition_item.dart'
    as _i96;
import '../features/institution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i101;
import '../features/institution_items/domain/usecases/add_unit_to_reference.dart'
    as _i102;
import '../features/institution_items/domain/usecases/get_institution_items.dart'
    as _i119;
import '../features/institution_items/domain/usecases/get_unit_suggestions.dart'
    as _i125;
import '../features/institution_items/domain/usecases/search_item.dart' as _i71;
import '../features/institution_items/domain/usecases/update_institution_item.dart'
    as _i83;
import '../features/institution_items/presentation/bloc/add_item/add_item_bloc.dart'
    as _i162;
import '../features/institution_items/presentation/bloc/item_units/units_bloc.dart'
    as _i132;
import '../features/institution_items/presentation/bloc/unit_entry/unit_entry_bloc.dart'
    as _i145;
import '../features/institution_items/presentation/cubit/institution_items/institution_items_cubit.dart'
    as _i127;
import '../features/institution_receipts/data/datasources/institution_receipts_api_service.dart'
    as _i36;
import '../features/institution_receipts/data/repositories/institution_receipts_repository_impl.dart'
    as _i38;
import '../features/institution_receipts/domain/repositories/institution_receipts_repository.dart'
    as _i37;
import '../features/institution_receipts/domain/usecases/add_institution_receipts.dart'
    as _i97;
import '../features/institution_receipts/domain/usecases/get_institution_receipts.dart'
    as _i121;
import '../features/institution_receipts/presentation/cubit/institution_receipts_cubit.dart'
    as _i130;
import '../features/jobs_offers/data/datasources/jobs_offers_api_service.dart'
    as _i50;
import '../features/jobs_offers/data/repositories/jobs_offers_repository_impl.dart'
    as _i52;
import '../features/jobs_offers/domain/repositories/jobs_offers_repository.dart'
    as _i51;
import '../features/jobs_offers/domain/usecases/accept_job_offer.dart' as _i93;
import '../features/jobs_offers/domain/usecases/decline_job_offer.dart'
    as _i113;
import '../features/jobs_offers/domain/usecases/get_jobs_offers.dart' as _i123;
import '../features/jobs_offers/presentation/cubit/jobs_offers_cubit.dart'
    as _i134;
import '../features/notifications/data/datasources/notifications_remote_api.dart'
    as _i56;
import '../features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i58;
import '../features/notifications/domain/repositories/notifications_repository.dart'
    as _i57;
import '../features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i138;
import '../features/orders/data/datasources/institution_orders_api_service.dart'
    as _i33;
import '../features/orders/data/datasources/user_orders_api_service.dart'
    as _i89;
import '../features/orders/data/repositories/institution_orders_repository_impl.dart'
    as _i35;
import '../features/orders/data/repositories/user_orders_repository_impl.dart'
    as _i91;
import '../features/orders/domain/repositories/institution_orders_repository.dart'
    as _i34;
import '../features/orders/domain/repositories/user_orders_repository.dart'
    as _i90;
import '../features/orders/domain/usecases/get_institution_orders.dart'
    as _i120;
import '../features/orders/domain/usecases/get_user_orders.dart' as _i126;
import '../features/orders/domain/usecases/place_order.dart' as _i139;
import '../features/orders/domain/usecases/update_institution_order.dart'
    as _i84;
import '../features/orders/presentation/cubit/cubit/institution_orders_cubit.dart'
    as _i129;
import '../features/orders/presentation/cubit/user_orders/user_orders_bloc.dart'
    as _i150;
import '../features/owner_institutions/data/datasources/user_institutions_service_api.dart'
    as _i88;
import '../features/owner_institutions/data/repositories/institutions_repository_impl.dart'
    as _i149;
import '../features/owner_institutions/domain/repositories/institutions_repository.dart'
    as _i148;
import '../features/owner_institutions/domain/usecases/add_institution.dart'
    as _i160;
import '../features/owner_institutions/domain/usecases/get_user_institutions.dart'
    as _i168;
import '../features/owner_institutions/domain/usecases/update_institution.dart'
    as _i173;
import '../features/owner_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i161;
import '../features/recruitment/data/datasources/recruitment_api_service.dart'
    as _i64;
import '../features/recruitment/data/repositories/recruitment_repository_impl.dart'
    as _i68;
import '../features/recruitment/domain/repositories/recruitment_repository.dart'
    as _i67;
import '../features/recruitment/domain/usecases/get_employees.dart' as _i118;
import '../features/recruitment/domain/usecases/get_sent_job_offers.dart'
    as _i124;
import '../features/recruitment/domain/usecases/remove_employee.dart' as _i69;
import '../features/recruitment/domain/usecases/remove_job_offer.dart' as _i70;
import '../features/recruitment/domain/usecases/send_job_offer.dart' as _i72;
import '../features/recruitment/presentation/cubit/employees/employees_cubit.dart'
    as _i167;
import '../features/recruitment/presentation/cubit/job_offers/send_job_offers_cubit.dart'
    as _i128;
import '../features/recruitment/presentation/cubit/recruitment/recruitment_cubit.dart'
    as _i66;
import '../features/settings/data/datasources/profile_api_service.dart' as _i61;
import '../features/settings/data/repositories/profile_repository_impl.dart'
    as _i63;
import '../features/settings/domain/repositories/profile_repository.dart'
    as _i62;
import '../features/settings/domain/usecases/update_email.dart' as _i81;
import '../features/settings/domain/usecases/update_phone_number.dart' as _i85;
import '../features/settings/domain/usecases/update_profile.dart' as _i87;
import '../features/settings/presentation/bloc/account_info/account_info_cubit.dart'
    as _i94;
import '../features/settings/presentation/bloc/add_email/add_email_cubit.dart'
    as _i170;
import '../features/settings/presentation/bloc/add_email/add_email_verification_cubit.dart'
    as _i157;
import '../features/settings/presentation/bloc/change_phone/update_phone_cubit.dart'
    as _i174;
import '../features/settings/presentation/bloc/change_phone/update_phone_verification_cubit.dart'
    as _i86;
import '../features/settings/presentation/bloc/cubit/update_email_cubit.dart'
    as _i82;
import '../features/start_up/data/datasources/startup_local_api.dart' as _i74;
import '../features/start_up/data/datasources/startup_remote_api.dart' as _i75;
import '../features/start_up/data/repositories/startup_repository_impl.dart'
    as _i144;
import '../features/start_up/domain/repositories/start_up_repository.dart'
    as _i143;
import '../features/start_up/domain/usecases/check_if_seen_before.dart'
    as _i165;
import '../features/start_up/domain/usecases/needs_a_forced_update.dart'
    as _i171;
import '../features/start_up/presentation/cubit/start_up/start_up_cubit.dart'
    as _i172;
import '../features/work_institutions/data/datasources/work_institution_api_service.dart'
    as _i92;
import '../features/work_institutions/data/repositories/work_institution_repository_impl.dart'
    as _i153;
import '../features/work_institutions/domain/usecases/get_work_institutions.dart'
    as _i169;
import '../features/work_institutions/domain/work_institution_repository.dart'
    as _i152;
import '../features/work_institutions/presentation/cubit/work_institutions_cubit.dart'
    as _i175;
import 'register_module.dart' as _i176; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.AddressSuggestionsApiService>(
      () => _i3.AddressSuggestionsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i5.AddressSuggestionsRepository>(() =>
      _i6.AddressSuggestionsRepositoryImpl(
          get<_i3.AddressSuggestionsApiService>()));
  gh.lazySingleton<_i7.AddressesLocalDataSource>(
      () => _i7.AddressesLocalDataSourceImpl());
  gh.lazySingleton<_i8.AddressesServiceApi>(() => _i8.AddressesServiceApiImpl(
        get<_i9.FirebaseAuth>(),
        get<_i4.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i10.AuthLocalService>(
      () => _i10.AuthLocalServiceImpl(get<_i11.SharedPreferences>()));
  gh.factory<_i12.CitiesSuggestionsBloc>(() => _i12.CitiesSuggestionsBloc(
        get<_i13.GetCitiesSuggestions>(),
        get<_i13.AddNewCity>(),
      ));
  gh.lazySingleton<_i14.ClientInstitutionItemsApi>(
      () => _i14.ClientInstitutionItemsApiImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i15.ClientInstitutionRepository>(
      () => _i16.ClientInstitutionRepositoryImpl(
            get<_i14.ClientInstitutionItemsApi>(),
            get<_i17.NetworkInfo>(),
          ));
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
        get<_i20.DeleteDistributionArea>(),
      ));
  gh.lazySingleton<_i21.DistributionAreasRepository>(
      () => _i22.DistributionAreasRepositoryImpl(
            get<_i18.DistributionAreaApiService>(),
            get<_i17.NetworkInfo>(),
          ));
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
  gh.factory<_i12.GovernatesSuggestionsBloc>(
      () => _i12.GovernatesSuggestionsBloc(
            get<_i13.GetGovernatesSuggestions>(),
            get<_i13.AddNewGovernate>(),
          ));
  gh.factory<_i31.InstitutionCartCubit>(() => _i31.InstitutionCartCubit());
  gh.lazySingleton<_i32.InstitutionClientsApiService>(() =>
      _i32.InstitutionClientsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i33.InstitutionOrdersApiService>(
      () => _i33.InstitutionOrdersApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i34.InstitutionOrdersRepository>(
      () => _i35.InstitutionOrdersRepositoryImpl(
            get<_i33.InstitutionOrdersApiService>(),
            get<_i17.NetworkInfo>(),
          ));
  gh.lazySingleton<_i36.InstitutionReceiptsApiService>(() =>
      _i36.InstitutionReceiptsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i37.InstitutionReceiptsRepository>(
      () => _i38.InstitutionReceiptsRepositoryImpl(
            get<_i36.InstitutionReceiptsApiService>(),
            get<_i17.NetworkInfo>(),
          ));
  gh.lazySingleton<_i39.InstitutionsApiService>(
      () => _i39.InstitutionsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i40.InstitutionsRepository>(
      () => _i41.InstitutionsRepositoryImpl(
            get<_i39.InstitutionsApiService>(),
            get<_i42.NetworkInfo>(),
          ));
  gh.factory<_i43.ItemAddToCartDialogCubit>(
      () => _i43.ItemAddToCartDialogCubit());
  gh.lazySingleton<_i44.ItemsApiService>(() => _i44.ItemsApiServiceImpl(
        get<_i9.FirebaseAuth>(),
        get<_i4.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i45.ItemsApiService2>(
      () => _i45.ItemsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i46.ItemsRepository>(() => _i47.ItemsRepositoryImpl(
        get<_i45.ItemsApiService2>(),
        get<_i42.NetworkInfo>(),
      ));
  gh.lazySingleton<_i48.ItemsRepository>(() => _i49.ItemsRepositoryImpl(
        get<_i44.ItemsApiService>(),
        get<_i17.NetworkInfo>(),
      ));
  gh.lazySingleton<_i50.JobsOffersApiService>(
      () => _i50.JobsOffersApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i51.JobsOffersRepository>(
      () => _i52.JobsOffersRepositoryImpl(
            get<_i50.JobsOffersApiService>(),
            get<_i17.NetworkInfo>(),
          ));
  await gh.factoryAsync<_i53.LocalStorage>(
    () => registerModule.localStorage,
    preResolve: true,
  );
  gh.factory<_i12.NeighborhoodsSuggestionsBloc>(
      () => _i12.NeighborhoodsSuggestionsBloc(
            get<_i13.GetNeighborhoodsSuggestions>(),
            get<_i13.AddNewNeighborhood>(),
          ));
  gh.lazySingleton<_i54.NotificationService>(
      () => _i55.FirebaseNotificationService());
  gh.lazySingleton<_i56.NotificationsApiService>(
      () => _i56.NotificationsApiServiceImpl(
            get<_i4.FirebaseFirestore>(),
            get<_i9.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i57.NotificationsRepository>(
      () => _i58.NotificationsRepositoryImpl(
            get<_i56.NotificationsApiService>(),
            get<_i17.NetworkInfo>(),
          ));
  gh.factory<_i59.PhoneSignInFormCubit>(() => _i59.PhoneSignInFormCubit(
        get<_i60.VerifyPhoneNumber>(),
        get<_i60.SignInWithPhone>(),
      ));
  gh.lazySingleton<_i61.ProfileApiService>(() => _i61.ProfileApiServiceImpl(
        get<_i9.FirebaseAuth>(),
        get<_i4.FirebaseFirestore>(),
      ));
  gh.lazySingleton<_i62.ProfileRepository>(() => _i63.ProfileRepositoryImpl(
        get<_i61.ProfileApiService>(),
        get<_i17.NetworkInfo>(),
      ));
  gh.lazySingleton<_i64.RecruitmentApiService>(
      () => _i64.RecruitmentApiServiceImpl(
            get<_i4.FirebaseFirestore>(),
            get<_i65.FirebaseFunctions>(),
          ));
  gh.factory<_i66.RecruitmentCubit>(() => _i66.RecruitmentCubit());
  gh.lazySingleton<_i67.RecruitmentRepository>(
      () => _i68.RecruitmentRepositoryImpl(
            get<_i64.RecruitmentApiService>(),
            get<_i17.NetworkInfo>(),
          ));
  gh.lazySingleton<_i69.RemoveEmployee>(
      () => _i69.RemoveEmployee(get<_i67.RecruitmentRepository>()));
  gh.lazySingleton<_i70.RemoveJobOffer>(
      () => _i70.RemoveJobOffer(get<_i67.RecruitmentRepository>()));
  gh.lazySingleton<_i71.SearchItem>(
      () => _i71.SearchItem(get<_i48.ItemsRepository>()));
  gh.lazySingleton<_i72.SendJobOffer>(
      () => _i72.SendJobOffer(get<_i67.RecruitmentRepository>()));
  gh.factory<_i73.SmsAutoFill>(() => registerModule.smsAutoFill);
  gh.lazySingleton<_i74.StartupLocalApi>(
      () => _i74.StartUpLocalApiImpl(get<_i11.SharedPreferences>()));
  gh.lazySingleton<_i75.StartupRemoteApi>(
      () => _i75.StartupRemoteApiImpl(get<_i76.FirebaseRemoteConfig>()));
  gh.lazySingleton<_i77.UnitsApiService>(
      () => _i77.UnitsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i78.UnitsRepository>(() => _i79.UnitsRepositoryImpl(
        get<_i17.NetworkInfo>(),
        get<_i77.UnitsApiService>(),
      ));
  gh.lazySingleton<_i80.UpdateDistributionArea>(() =>
      _i80.UpdateDistributionArea(get<_i21.DistributionAreasRepository>()));
  gh.lazySingleton<_i81.UpdateEmail>(
      () => _i81.UpdateEmail(get<_i62.ProfileRepository>()));
  gh.factory<_i82.UpdateEmailCubit>(
      () => _i82.UpdateEmailCubit(get<_i81.UpdateEmail>()));
  gh.lazySingleton<_i83.UpdateInstitutionItem>(
      () => _i83.UpdateInstitutionItem(get<_i48.ItemsRepository>()));
  gh.lazySingleton<_i84.UpdateInstitutionOrder>(() =>
      _i84.UpdateInstitutionOrder(get<_i34.InstitutionOrdersRepository>()));
  gh.lazySingleton<_i85.UpdatePhoneNumber>(
      () => _i85.UpdatePhoneNumber(get<_i62.ProfileRepository>()));
  gh.factory<_i86.UpdatePhoneVerificationCubit>(
      () => _i86.UpdatePhoneVerificationCubit(
            get<_i85.UpdatePhoneNumber>(),
            get<_i73.SmsAutoFill>(),
          ));
  gh.lazySingleton<_i87.UpdateProfile>(
      () => _i87.UpdateProfile(get<_i62.ProfileRepository>()));
  gh.lazySingleton<_i88.UserInstitutionsServiceApi>(
      () => _i88.UserInstitutionsServiceApiImpl(
            get<_i9.FirebaseAuth>(),
            get<_i4.FirebaseFirestore>(),
          ));
  gh.lazySingleton<_i89.UserOrdersApiService>(
      () => _i89.UserOrdersApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i90.UserOrdersRepository>(
      () => _i91.UserOrdersRepositoryImpl(
            get<_i89.UserOrdersApiService>(),
            get<_i17.NetworkInfo>(),
          ));
  gh.lazySingleton<_i92.WorkIstitutionsApiService>(
      () => _i92.WorkIstitutionsApiServiceImpl(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i93.AcceptJobOffer>(
      () => _i93.AcceptJobOffer(get<_i51.JobsOffersRepository>()));
  gh.factory<_i94.AccountInfoCubit>(
      () => _i94.AccountInfoCubit(get<_i87.UpdateProfile>()));
  gh.lazySingleton<_i95.AddDistributionArea>(
      () => _i95.AddDistributionArea(get<_i21.DistributionAreasRepository>()));
  gh.lazySingleton<_i96.AddInstitutionItem>(
      () => _i96.AddInstitutionItem(get<_i48.ItemsRepository>()));
  gh.lazySingleton<_i97.AddInstitutionReceipt>(() =>
      _i97.AddInstitutionReceipt(get<_i37.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i98.AddNewCity>(
      () => _i98.AddNewCity(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i99.AddNewGovernate>(
      () => _i99.AddNewGovernate(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i100.AddNewNeighborhood>(
      () => _i100.AddNewNeighborhood(get<_i5.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i101.AddRefAndInstitutionItem>(
      () => _i101.AddRefAndInstitutionItem(get<_i48.ItemsRepository>()));
  gh.lazySingleton<_i102.AddUnitToReference>(
      () => _i102.AddUnitToReference(get<_i78.UnitsRepository>()));
  gh.lazySingleton<_i103.AddressesRepository>(
      () => _i104.AddressesRepositoryImpl(
            get<_i8.AddressesServiceApi>(),
            get<_i17.NetworkInfo>(),
            get<_i7.AddressesLocalDataSource>(),
          ));
  gh.lazySingleton<_i105.AuthApiService>(() => _i105.AuthApiServiceImpl(
        firebaseAuth: get<_i106.FirebaseAuth>(),
        googleSignIn: get<_i107.GoogleSignIn>(),
        facebookAuth: get<_i108.FacebookAuth>(),
        firestore: get<_i109.FirebaseFirestore>(),
        cloudFunctions: get<_i110.FirebaseFunctions>(),
        firebaseMessaging: get<_i24.FirebaseMessaging>(),
        sharedPreferences: get<_i11.SharedPreferences>(),
      ));
  gh.lazySingleton<_i111.AuthRepository>(() => _i112.AuthRepositoryImpl(
        authApiService: get<_i105.AuthApiService>(),
        authLocalService: get<_i10.AuthLocalService>(),
        networkInfo: get<_i42.NetworkInfo>(),
      ));
  gh.lazySingleton<_i113.DeclineJobOffer>(
      () => _i113.DeclineJobOffer(get<_i51.JobsOffersRepository>()));
  gh.lazySingleton<_i114.DeleteDistributionArea>(() =>
      _i114.DeleteDistributionArea(get<_i21.DistributionAreasRepository>()));
  gh.lazySingleton<_i115.GetAddressInstitutions>(
      () => _i115.GetAddressInstitutions(get<_i40.InstitutionsRepository>()));
  gh.lazySingleton<_i116.GetAddresses>(
      () => _i116.GetAddresses(get<_i103.AddressesRepository>()));
  gh.lazySingleton<_i117.GetCurrentLocation>(
      () => _i117.GetCurrentLocation(get<_i103.AddressesRepository>()));
  gh.lazySingleton<_i118.GetEmployees>(
      () => _i118.GetEmployees(get<_i67.RecruitmentRepository>()));
  gh.lazySingleton<_i119.GetInstitutionItems>(
      () => _i119.GetInstitutionItems(get<_i48.ItemsRepository>()));
  gh.lazySingleton<_i120.GetInstitutionOrders>(() =>
      _i120.GetInstitutionOrders(get<_i34.InstitutionOrdersRepository>()));
  gh.lazySingleton<_i121.GetInstitutionReceipts>(() =>
      _i121.GetInstitutionReceipts(get<_i37.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i122.GetItems>(
      () => _i122.GetItems(get<_i46.ItemsRepository>()));
  gh.lazySingleton<_i123.GetJobsOffers>(
      () => _i123.GetJobsOffers(get<_i51.JobsOffersRepository>()));
  gh.lazySingleton<_i124.GetSentJobOffers>(
      () => _i124.GetSentJobOffers(get<_i67.RecruitmentRepository>()));
  gh.lazySingleton<_i125.GetUnitSuggestions>(
      () => _i125.GetUnitSuggestions(get<_i78.UnitsRepository>()));
  gh.lazySingleton<_i126.GetUserOrders>(
      () => _i126.GetUserOrders(get<_i90.UserOrdersRepository>()));
  gh.factory<_i127.InstitutionItemsCubit>(
      () => _i127.InstitutionItemsCubit(get<_i119.GetInstitutionItems>()));
  gh.factory<_i128.InstitutionJobsOffersCubit>(
      () => _i128.InstitutionJobsOffersCubit(
            get<_i124.GetSentJobOffers>(),
            get<_i72.SendJobOffer>(),
            get<_i70.RemoveJobOffer>(),
          ));
  gh.factory<_i129.InstitutionOrdersCubit>(() => _i129.InstitutionOrdersCubit(
        get<_i120.GetInstitutionOrders>(),
        get<_i84.UpdateInstitutionOrder>(),
      ));
  gh.factory<_i130.InstitutionReceiptsCubit>(
      () => _i130.InstitutionReceiptsCubit(
            get<_i119.GetInstitutionItems>(),
            get<_i121.GetInstitutionReceipts>(),
            get<_i97.AddInstitutionReceipt>(),
          ));
  gh.factory<_i131.InstitutionsCubit>(
      () => _i131.InstitutionsCubit(get<_i115.GetAddressInstitutions>()));
  gh.factory<_i132.ItemUnitsBloc>(() => _i132.ItemUnitsBloc(
        get<_i125.GetUnitSuggestions>(),
        get<_i102.AddUnitToReference>(),
      ));
  gh.factory<_i133.ItemsCubit>(() => _i133.ItemsCubit(get<_i122.GetItems>()));
  gh.factory<_i134.JobsOffersCubit>(() => _i134.JobsOffersCubit(
        get<_i123.GetJobsOffers>(),
        get<_i93.AcceptJobOffer>(),
        get<_i113.DeclineJobOffer>(),
      ));
  gh.lazySingleton<_i135.LinkEmailAndPassword>(
      () => _i135.LinkEmailAndPassword(get<_i111.AuthRepository>()));
  gh.factory<_i136.LocationWidgetCubit>(
      () => _i136.LocationWidgetCubit(get<_i117.GetCurrentLocation>()));
  gh.lazySingleton<_i137.LogOut>(
      () => _i137.LogOut(get<_i111.AuthRepository>()));
  gh.factory<_i138.NotificationsBloc>(
      () => _i138.NotificationsBloc(get<_i57.NotificationsRepository>()));
  gh.lazySingleton<_i139.PlaceOrder>(
      () => _i139.PlaceOrder(get<_i90.UserOrdersRepository>()));
  gh.lazySingleton<_i140.RemoveAddress>(
      () => _i140.RemoveAddress(get<_i103.AddressesRepository>()));
  gh.factory<_i141.SelectLocationMapBloc>(
      () => _i141.SelectLocationMapBloc(get<_i117.GetCurrentLocation>()));
  gh.lazySingleton<_i142.SignInWithPhone>(
      () => _i142.SignInWithPhone(get<_i111.AuthRepository>()));
  gh.lazySingleton<_i143.StartUpRepository>(() => _i144.StartUpRepositoryImpl(
        get<_i75.StartupRemoteApi>(),
        get<_i74.StartupLocalApi>(),
      ));
  gh.factory<_i145.UnitEntryBloc>(() => _i145.UnitEntryBloc(
        get<_i125.GetUnitSuggestions>(),
        get<_i102.AddUnitToReference>(),
      ));
  gh.lazySingleton<_i146.UpdateAddress>(
      () => _i146.UpdateAddress(get<_i103.AddressesRepository>()));
  gh.lazySingleton<_i147.UpdateMainAddress>(
      () => _i147.UpdateMainAddress(get<_i103.AddressesRepository>()));
  gh.lazySingleton<_i148.UserInstitutionsRepository>(
      () => _i149.UserInstitutionsRepositoryImpl(
            get<_i88.UserInstitutionsServiceApi>(),
            get<_i42.NetworkInfo>(),
          ));
  gh.factory<_i150.UserOrdersBloc>(() => _i150.UserOrdersBloc(
        get<_i126.GetUserOrders>(),
        get<_i84.UpdateInstitutionOrder>(),
      ));
  gh.lazySingleton<_i151.VerifyPhoneNumber>(
      () => _i151.VerifyPhoneNumber(get<_i111.AuthRepository>()));
  gh.lazySingleton<_i152.WorkInstitutionRepository>(
      () => _i153.WorkInstitutionRepositoryImpl(
            get<_i92.WorkIstitutionsApiService>(),
            get<_i17.NetworkInfo>(),
          ));
  gh.lazySingleton<_i154.AddAddress>(
      () => _i154.AddAddress(get<_i103.AddressesRepository>()));
  gh.factory<_i155.AddEditAddressCubit>(() => _i155.AddEditAddressCubit(
        get<_i156.AddAddress>(),
        get<_i156.UpdateAddress>(),
        get<_i147.UpdateMainAddress>(),
      ));
  gh.factory<_i157.AddEmailVerificationCubit>(
      () => _i157.AddEmailVerificationCubit(
            get<_i135.LinkEmailAndPassword>(),
            get<_i73.SmsAutoFill>(),
          ));
  gh.lazySingleton<_i158.AddFirstAddress>(
      () => _i158.AddFirstAddress(get<_i103.AddressesRepository>()));
  gh.lazySingleton<_i159.AddFirstAddressCubit>(
      () => _i159.AddFirstAddressCubit(get<_i158.AddFirstAddress>()));
  gh.lazySingleton<_i160.AddInstitution>(
      () => _i160.AddInstitution(get<_i148.UserInstitutionsRepository>()));
  gh.factory<_i161.AddInstitutionCubit>(
      () => _i161.AddInstitutionCubit(get<_i160.AddInstitution>()));
  gh.factory<_i162.AddItemBloc>(() => _i162.AddItemBloc(
        get<_i71.SearchItem>(),
        get<_i96.AddInstitutionItem>(),
        get<_i101.AddRefAndInstitutionItem>(),
        get<_i83.UpdateInstitutionItem>(),
      ));
  gh.factory<_i163.AddressesCubit>(
      () => _i163.AddressesCubit(get<_i116.GetAddresses>()));
  gh.factory<_i164.AppBloc>(
      () => _i164.AppBloc(authRepository: get<_i111.AuthRepository>()));
  gh.lazySingleton<_i165.CheckIfSeenBefore>(
      () => _i165.CheckIfSeenBefore(get<_i143.StartUpRepository>()));
  gh.factory<_i166.ClientInstitutionCubit>(() => _i166.ClientInstitutionCubit(
        get<_i26.GetClientInstitutionItems>(),
        get<_i139.PlaceOrder>(),
      ));
  gh.factory<_i167.EmployeesCubit>(() => _i167.EmployeesCubit(
        get<_i118.GetEmployees>(),
        get<_i69.RemoveEmployee>(),
      ));
  gh.lazySingleton<_i168.GetUserInstitutions>(
      () => _i168.GetUserInstitutions(get<_i148.UserInstitutionsRepository>()));
  gh.lazySingleton<_i169.GetWorkInstitutions>(
      () => _i169.GetWorkInstitutions(get<_i152.WorkInstitutionRepository>()));
  gh.factory<_i170.LinkEmailAndPasswordCubit>(
      () => _i170.LinkEmailAndPasswordCubit(get<_i151.VerifyPhoneNumber>()));
  gh.lazySingleton<_i171.NeedsAForcedUpdate>(
      () => _i171.NeedsAForcedUpdate(get<_i143.StartUpRepository>()));
  gh.factory<_i172.StartUpCubit>(() => _i172.StartUpCubit(
        get<_i171.NeedsAForcedUpdate>(),
        get<_i165.CheckIfSeenBefore>(),
      ));
  gh.lazySingleton<_i173.UpdateInstitution>(
      () => _i173.UpdateInstitution(get<_i148.UserInstitutionsRepository>()));
  gh.factory<_i174.UpdatePhoneCubit>(
      () => _i174.UpdatePhoneCubit(get<_i151.VerifyPhoneNumber>()));
  gh.factory<_i175.WorkInstitutionsCubit>(
      () => _i175.WorkInstitutionsCubit(get<_i169.GetWorkInstitutions>()));
  return get;
}

class _$RegisterModule extends _i176.RegisterModule {}
