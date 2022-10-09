// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i65;
import 'package:cloud_functions/cloud_functions.dart' as _i111;
import 'package:firebase_auth/firebase_auth.dart' as _i64;
import 'package:firebase_messaging/firebase_messaging.dart' as _i26;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i110;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i109;
import 'package:injectable/injectable.dart' as _i2;
import 'package:localstorage/localstorage.dart' as _i54;
import 'package:root_package/core/services/network_info.dart' as _i19;
import 'package:root_package/packages/cloud_firestore.dart' as _i6;
import 'package:root_package/packages/cloud_functions.dart' as _i69;
import 'package:root_package/packages/firebase_auth.dart' as _i11;
import 'package:root_package/packages/flutter_facebook_auth.dart' as _i25;
import 'package:root_package/packages/google_sign_in.dart' as _i32;
import 'package:root_package/packages/shared_preferences.dart' as _i13;
import 'package:root_package/root_package.dart' as _i43;
import 'package:sms_autofill/sms_autofill.dart' as _i77;

import '../core/services/firebase_notification_service.dart' as _i56;
import '../core/services/notification_service.dart' as _i55;
import '../features/address/data/datasources/address_local_data_source.dart'
    as _i9;
import '../features/address/data/datasources/addresses_service_api.dart'
    as _i10;
import '../features/address/data/repositories/addresses_repository_impl.dart'
    as _i107;
import '../features/address/domain/repositories/addresses_repository.dart'
    as _i106;
import '../features/address/domain/usecases/add_address.dart' as _i153;
import '../features/address/domain/usecases/add_first_address.dart' as _i155;
import '../features/address/domain/usecases/get_addresses.dart' as _i118;
import '../features/address/domain/usecases/get_current_location.dart' as _i119;
import '../features/address/domain/usecases/remove_address.dart' as _i142;
import '../features/address/domain/usecases/update_address.dart' as _i146;
import '../features/address/domain/usecases/usecases.dart' as _i4;
import '../features/address/presentation/bloc/select_location_map/select_location_map_bloc.dart'
    as _i143;
import '../features/address/presentation/cubit/add_edit_address/add_edit_address_cubit.dart'
    as _i3;
import '../features/address/presentation/cubit/add_first_address/add_first_address_cubit.dart'
    as _i156;
import '../features/address/presentation/cubit/addresses/addresses_cubit.dart'
    as _i161;
import '../features/address_suggestions/data/datasources/address_suggestions_api_service.dart'
    as _i5;
import '../features/address_suggestions/data/repositories/address_suggestions_repository_impl.dart'
    as _i8;
import '../features/address_suggestions/domain/repositories/address_suggestions_repository.dart'
    as _i7;
import '../features/address_suggestions/domain/usecases/add_new_city.dart'
    as _i101;
import '../features/address_suggestions/domain/usecases/add_new_governate.dart'
    as _i102;
import '../features/address_suggestions/domain/usecases/add_new_neighborhood.dart'
    as _i103;
import '../features/address_suggestions/domain/usecases/get_cities_suggetsions.dart'
    as _i27;
import '../features/address_suggestions/domain/usecases/get_districts_suggestions.dart'
    as _i31;
import '../features/address_suggestions/domain/usecases/get_governates_suggestions.dart'
    as _i30;
import '../features/address_suggestions/domain/usecases/usecases.dart' as _i15;
import '../features/address_suggestions/presentation/bloc/address_suggestions_bloc.dart'
    as _i14;
import '../features/address_suggestions/presentation/cubit/location_widget/location_widget_cubit.dart'
    as _i137;
import '../features/auth/data/datasources/local/auth_local_service.dart'
    as _i12;
import '../features/auth/data/datasources/remote/auth_api_service.dart'
    as _i108;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i113;
import '../features/auth/domain/repositories/auth_repository.dart' as _i112;
import '../features/auth/domain/usecases/link_email_and_password.dart' as _i136;
import '../features/auth/domain/usecases/log_out.dart' as _i138;
import '../features/auth/domain/usecases/sign_in_with_phone.dart' as _i144;
import '../features/auth/domain/usecases/usecases.dart' as _i62;
import '../features/auth/domain/usecases/verify_phone_number.dart' as _i150;
import '../features/auth/presentation/bloc/app_status/app_bloc.dart' as _i162;
import '../features/auth/presentation/bloc/sign_in/phone_sign_in_form_cubit.dart'
    as _i61;
import '../features/cart/presentation/cubit/institution_cart/institution_cart_cubit.dart'
    as _i33;
import '../features/cart/presentation/cubit/item_add_to_cart_dialog/item_add_to_cart_dialog_cubit.dart'
    as _i44;
import '../features/client_institutions/data/datasources/client_institution_items_api.dart'
    as _i16;
import '../features/client_institutions/data/repositories/client_institution_repository_impl.dart'
    as _i18;
import '../features/client_institutions/domain/repositories/client_institution_repository.dart'
    as _i17;
import '../features/client_institutions/domain/usecases/get_client_institution_item.dart'
    as _i28;
import '../features/client_institutions/presentation/cubit/client_institution/client_institutions_cubit.dart'
    as _i163;
import '../features/distribution_areas/data/datasources/distribution_area_api_service.dart'
    as _i20;
import '../features/distribution_areas/data/repositories/distribution_areas_repository_impl.dart'
    as _i24;
import '../features/distribution_areas/domain/repositories/distribution_area_repository.dart'
    as _i23;
import '../features/distribution_areas/domain/usecases/add_distribution_area.dart'
    as _i98;
import '../features/distribution_areas/domain/usecases/delete_distribution_area.dart'
    as _i116;
import '../features/distribution_areas/domain/usecases/get_distribution_areas.dart'
    as _i29;
import '../features/distribution_areas/domain/usecases/update_distribution_area.dart'
    as _i83;
import '../features/distribution_areas/domain/usecases/usecases.dart' as _i22;
import '../features/distribution_areas/presentation/bloc/distribution_areas_bloc.dart'
    as _i21;
import '../features/home/data/datasources/items_api_servic.dart' as _i46;
import '../features/home/data/repositories/items_repository_impl.dart' as _i48;
import '../features/home/domain/repositories/items_repository.dart' as _i47;
import '../features/home/domain/usecases/get_items.dart' as _i124;
import '../features/home/presentation/cubit/items/items_cubit.dart' as _i134;
import '../features/institution_items/data/datasources/items_api_service.dart'
    as _i45;
import '../features/institution_items/data/datasources/units_api_service.dart'
    as _i80;
import '../features/institution_items/data/repositories/items_repository_impl.dart'
    as _i50;
import '../features/institution_items/data/repositories/units_repository_impl.dart'
    as _i82;
import '../features/institution_items/domain/repositories/items_repository.dart'
    as _i49;
import '../features/institution_items/domain/repositories/units_repository.dart'
    as _i81;
import '../features/institution_items/domain/usecases/add_instition_item.dart'
    as _i99;
import '../features/institution_items/domain/usecases/add_ref_and_institution_item.dart'
    as _i104;
import '../features/institution_items/domain/usecases/add_unit_to_reference.dart'
    as _i105;
import '../features/institution_items/domain/usecases/get_institution_items.dart'
    as _i121;
import '../features/institution_items/domain/usecases/get_unit_suggestions.dart'
    as _i127;
import '../features/institution_items/domain/usecases/search_item.dart' as _i75;
import '../features/institution_items/domain/usecases/update_institution_item.dart'
    as _i86;
import '../features/institution_items/presentation/bloc/add_item/add_item_bloc.dart'
    as _i159;
import '../features/institution_items/presentation/bloc/add_unit/add_unit_bloc.dart'
    as _i160;
import '../features/institution_items/presentation/cubit/institution_items/institution_items_cubit.dart'
    as _i129;
import '../features/institution_receipts/data/datasources/institution_receipts_api_service.dart'
    as _i37;
import '../features/institution_receipts/data/repositories/institution_receipts_repository_impl.dart'
    as _i39;
import '../features/institution_receipts/domain/repositories/institution_receipts_repository.dart'
    as _i38;
import '../features/institution_receipts/domain/usecases/add_institution_receipts.dart'
    as _i100;
import '../features/institution_receipts/domain/usecases/get_institution_receipts.dart'
    as _i123;
import '../features/institution_receipts/presentation/cubit/institution_receipts_cubit.dart'
    as _i132;
import '../features/institutions/data/datasources/institutions_api_service.dart'
    as _i40;
import '../features/institutions/data/repositories/institutions_repository_impl.dart'
    as _i42;
import '../features/institutions/domain/repositories/institutions_repository.dart'
    as _i41;
import '../features/institutions/domain/usecases/get_institutions.dart'
    as _i117;
import '../features/institutions/presentation/cubit/institutions_cubit.dart'
    as _i133;
import '../features/jobs_offers/data/datasources/jobs_offers_api_service.dart'
    as _i51;
import '../features/jobs_offers/data/repositories/jobs_offers_repository_impl.dart'
    as _i53;
import '../features/jobs_offers/domain/repositories/jobs_offers_repository.dart'
    as _i52;
import '../features/jobs_offers/domain/usecases/accept_job_offer.dart' as _i96;
import '../features/jobs_offers/domain/usecases/decline_job_offer.dart'
    as _i115;
import '../features/jobs_offers/domain/usecases/get_jobs_offers.dart' as _i125;
import '../features/jobs_offers/presentation/cubit/jobs_offers_cubit.dart'
    as _i135;
import '../features/notifications/data/datasources/notifications_remote_api.dart'
    as _i57;
import '../features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i60;
import '../features/notifications/domain/repositories/notifications_repository.dart'
    as _i59;
import '../features/notifications/presentation/bloc/notifications_bloc.dart'
    as _i139;
import '../features/orders/data/datasources/institution_orders_api_service.dart'
    as _i34;
import '../features/orders/data/datasources/user_orders_api_service.dart'
    as _i92;
import '../features/orders/data/repositories/institution_orders_repository_impl.dart'
    as _i36;
import '../features/orders/data/repositories/user_orders_repository_impl.dart'
    as _i94;
import '../features/orders/domain/repositories/institution_orders_repository.dart'
    as _i35;
import '../features/orders/domain/repositories/user_orders_repository.dart'
    as _i93;
import '../features/orders/domain/usecases/get_institution_orders.dart'
    as _i122;
import '../features/orders/domain/usecases/get_user_orders.dart' as _i128;
import '../features/orders/domain/usecases/place_order.dart' as _i140;
import '../features/orders/domain/usecases/update_institution_order.dart'
    as _i87;
import '../features/orders/presentation/cubit/cubit/institution_orders_cubit.dart'
    as _i131;
import '../features/orders/presentation/cubit/user_orders/user_orders_bloc.dart'
    as _i149;
import '../features/recruitment/data/datasources/recruitment_api_service.dart'
    as _i68;
import '../features/recruitment/data/repositories/recruitment_repository_impl.dart'
    as _i72;
import '../features/recruitment/domain/repositories/recruitment_repository.dart'
    as _i71;
import '../features/recruitment/domain/usecases/get_employees.dart' as _i120;
import '../features/recruitment/domain/usecases/get_sent_job_offers.dart'
    as _i126;
import '../features/recruitment/domain/usecases/remove_employee.dart' as _i73;
import '../features/recruitment/domain/usecases/remove_job_offer.dart' as _i74;
import '../features/recruitment/domain/usecases/send_job_offer.dart' as _i76;
import '../features/recruitment/presentation/cubit/employees/employees_cubit.dart'
    as _i164;
import '../features/recruitment/presentation/cubit/job_offers/send_job_offers_cubit.dart'
    as _i130;
import '../features/recruitment/presentation/cubit/recruitment/recruitment_cubit.dart'
    as _i70;
import '../features/settings/data/datasources/profile_api_service.dart' as _i63;
import '../features/settings/data/repositories/profile_repository_impl.dart'
    as _i67;
import '../features/settings/domain/repositories/profile_repository.dart'
    as _i66;
import '../features/settings/domain/usecases/update_email.dart' as _i84;
import '../features/settings/domain/usecases/update_phone_number.dart' as _i88;
import '../features/settings/domain/usecases/update_profile.dart' as _i90;
import '../features/settings/presentation/bloc/account_info/account_info_cubit.dart'
    as _i97;
import '../features/settings/presentation/bloc/add_email/add_email_cubit.dart'
    as _i167;
import '../features/settings/presentation/bloc/add_email/add_email_verification_cubit.dart'
    as _i154;
import '../features/settings/presentation/bloc/change_phone/update_phone_cubit.dart'
    as _i169;
import '../features/settings/presentation/bloc/change_phone/update_phone_verification_cubit.dart'
    as _i89;
import '../features/settings/presentation/bloc/cubit/update_email_cubit.dart'
    as _i85;
import '../features/start_up/data/datasources/local_data_source.dart' as _i58;
import '../features/start_up/data/repositories/start_up_repository_impl.dart'
    as _i79;
import '../features/start_up/domain/repositories/start_up_repository.dart'
    as _i78;
import '../features/start_up/domain/usecases/check_if_seen_before.dart'
    as _i114;
import '../features/start_up/domain/usecases/register_fcm_device_token.dart'
    as _i141;
import '../features/start_up/presentation/cubit/start_up/start_up_cubit.dart'
    as _i145;
import '../features/user_institutions/data/datasources/user_institutions_service_api.dart'
    as _i91;
import '../features/user_institutions/data/repositories/institutions_repository_impl.dart'
    as _i148;
import '../features/user_institutions/domain/repositories/institutions_repository.dart'
    as _i147;
import '../features/user_institutions/domain/usecases/add_institution.dart'
    as _i157;
import '../features/user_institutions/domain/usecases/get_user_institutions.dart'
    as _i165;
import '../features/user_institutions/domain/usecases/update_institution.dart'
    as _i168;
import '../features/user_institutions/presentation/cubit/add_institution/add_institution_cubit.dart'
    as _i158;
import '../features/user_institutions/presentation/cubit/institutions_cubit/institutions_cubit.dart'
    as _i170;
import '../features/work_institutions/data/datasources/work_institution_api_service.dart'
    as _i95;
import '../features/work_institutions/data/repositories/work_institution_repository_impl.dart'
    as _i152;
import '../features/work_institutions/domain/usecases/get_work_institutions.dart'
    as _i166;
import '../features/work_institutions/domain/work_institution_repository.dart'
    as _i151;
import '../features/work_institutions/presentation/cubit/work_institutions_cubit.dart'
    as _i171;
import 'register_module.dart' as _i172; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
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
      () => _i12.AuthLocalServiceImpl(get<_i13.SharedPreferences>()));
  gh.factory<_i14.CitiesSuggestionsBloc>(() => _i14.CitiesSuggestionsBloc(
      get<_i15.GetCitiesSuggestions>(), get<_i15.AddNewCity>()));
  gh.lazySingleton<_i16.ClientInstitutionItemsApi>(
      () => _i16.ClientInstitutionItemsApiImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i17.ClientInstitutionRepository>(() =>
      _i18.ClientInstitutionRepositoryImpl(
          get<_i16.ClientInstitutionItemsApi>(), get<_i19.NetworkInfo>()));
  gh.lazySingleton<_i20.DistributionAreaApiService>(
      () => _i20.DistributionAreaApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.factory<_i21.DistributionAreasBloc>(() => _i21.DistributionAreasBloc(
      get<_i15.GetGovernatesSuggestions>(),
      get<_i15.GetCitiesSuggestions>(),
      get<_i15.GetNeighborhoodsSuggestions>(),
      get<_i15.AddNewGovernate>(),
      get<_i15.AddNewCity>(),
      get<_i15.AddNewNeighborhood>(),
      get<_i22.GetDistributionAreas>(),
      get<_i22.AddDistributionArea>(),
      get<_i22.UpdateDistributionArea>(),
      get<_i22.DeleteDistributionArea>()));
  gh.lazySingleton<_i23.DistributionAreasRepository>(() =>
      _i24.DistributionAreasRepositoryImpl(
          get<_i20.DistributionAreaApiService>(), get<_i19.NetworkInfo>()));
  gh.factory<_i25.FacebookAuth>(() => registerModule.facebookAuth);
  gh.factory<_i26.FirebaseMessaging>(() => registerModule.firebaseMessaging);
  gh.lazySingleton<_i27.GetCitiesSuggestions>(
      () => _i27.GetCitiesSuggestions(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i28.GetClientInstitutionItems>(() =>
      _i28.GetClientInstitutionItems(get<_i17.ClientInstitutionRepository>()));
  gh.lazySingleton<_i29.GetDistributionAreas>(
      () => _i29.GetDistributionAreas(get<_i23.DistributionAreasRepository>()));
  gh.lazySingleton<_i30.GetGovernatesSuggestions>(() =>
      _i30.GetGovernatesSuggestions(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i31.GetNeighborhoodsSuggestions>(() =>
      _i31.GetNeighborhoodsSuggestions(
          get<_i7.AddressSuggestionsRepository>()));
  gh.factory<_i32.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i14.GovernatesSuggestionsBloc>(() =>
      _i14.GovernatesSuggestionsBloc(
          get<_i15.GetGovernatesSuggestions>(), get<_i15.AddNewGovernate>()));
  gh.factory<_i33.InstitutionCartCubit>(() => _i33.InstitutionCartCubit());
  gh.lazySingleton<_i34.InstitutionOrdersApiService>(
      () => _i34.InstitutionOrdersApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i35.InstitutionOrdersRepository>(() =>
      _i36.InstitutionOrdersRepositoryImpl(
          get<_i34.InstitutionOrdersApiService>(), get<_i19.NetworkInfo>()));
  gh.lazySingleton<_i37.InstitutionReceiptsApiService>(() =>
      _i37.InstitutionReceiptsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i38.InstitutionReceiptsRepository>(() =>
      _i39.InstitutionReceiptsRepositoryImpl(
          get<_i37.InstitutionReceiptsApiService>(), get<_i19.NetworkInfo>()));
  gh.lazySingleton<_i40.InstitutionsApiService>(
      () => _i40.InstitutionsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i41.InstitutionsRepository>(() =>
      _i42.InstitutionsRepositoryImpl(
          get<_i40.InstitutionsApiService>(), get<_i43.NetworkInfo>()));
  gh.factory<_i44.ItemAddToCartDialogCubit>(
      () => _i44.ItemAddToCartDialogCubit());
  gh.lazySingleton<_i45.ItemsApiService>(() => _i45.ItemsApiServiceImpl(
      get<_i11.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i46.ItemsApiService2>(
      () => _i46.ItemsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i47.ItemsRepository>(() => _i48.ItemsRepositoryImpl(
      get<_i46.ItemsApiService2>(), get<_i43.NetworkInfo>()));
  gh.lazySingleton<_i49.ItemsRepository>(() => _i50.ItemsRepositoryImpl(
      get<_i45.ItemsApiService>(), get<_i19.NetworkInfo>()));
  gh.lazySingleton<_i51.JobsOffersApiService>(
      () => _i51.JobsOffersApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i52.JobsOffersRepository>(() =>
      _i53.JobsOffersRepositoryImpl(
          get<_i51.JobsOffersApiService>(), get<_i19.NetworkInfo>()));
  await gh.factoryAsync<_i54.LocalStorage>(() => registerModule.localStorage,
      preResolve: true);
  gh.factory<_i14.NeighborhoodsSuggestionsBloc>(() =>
      _i14.NeighborhoodsSuggestionsBloc(get<_i15.GetNeighborhoodsSuggestions>(),
          get<_i15.AddNewNeighborhood>()));
  gh.lazySingleton<_i55.NotificationService>(
      () => _i56.FirebaseNotificationService());
  gh.lazySingleton<_i57.NotificationsApiService>(() =>
      _i57.NotificationsApiServiceImpl(
          get<_i6.FirebaseFirestore>(), get<_i11.FirebaseAuth>()));
  gh.lazySingleton<_i58.NotificationsLocalApi>(
      () => _i58.NotificationsLocalApiImpl(get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i59.NotificationsRepository>(() =>
      _i60.NotificationsRepositoryImpl(
          get<_i57.NotificationsApiService>(), get<_i19.NetworkInfo>()));
  gh.factory<_i61.PhoneSignInFormCubit>(() => _i61.PhoneSignInFormCubit(
      get<_i62.VerifyPhoneNumber>(), get<_i62.SignInWithPhone>()));
  gh.lazySingleton<_i63.ProfileApiService>(() => _i63.ProfileApiServiceImpl(
      get<_i64.FirebaseAuth>(), get<_i65.FirebaseFirestore>()));
  gh.lazySingleton<_i66.ProfileRepository>(() => _i67.ProfileRepositoryImpl(
      get<_i63.ProfileApiService>(), get<_i19.NetworkInfo>()));
  gh.lazySingleton<_i68.RecruitmentApiService>(() =>
      _i68.RecruitmentApiServiceImpl(
          get<_i6.FirebaseFirestore>(), get<_i69.FirebaseFunctions>()));
  gh.factory<_i70.RecruitmentCubit>(() => _i70.RecruitmentCubit());
  gh.lazySingleton<_i71.RecruitmentRepository>(() =>
      _i72.RecruitmentRepositoryImpl(
          get<_i68.RecruitmentApiService>(), get<_i19.NetworkInfo>()));
  gh.lazySingleton<_i73.RemoveEmployee>(
      () => _i73.RemoveEmployee(get<_i71.RecruitmentRepository>()));
  gh.lazySingleton<_i74.RemoveJobOffer>(
      () => _i74.RemoveJobOffer(get<_i71.RecruitmentRepository>()));
  gh.lazySingleton<_i75.SearchItem>(
      () => _i75.SearchItem(get<_i49.ItemsRepository>()));
  gh.lazySingleton<_i76.SendJobOffer>(
      () => _i76.SendJobOffer(get<_i71.RecruitmentRepository>()));
  gh.factory<_i77.SmsAutoFill>(() => registerModule.smsAutoFill);
  gh.lazySingleton<_i78.StartUpRepository>(
      () => _i79.StartUpRepositoryImpl(get<_i58.NotificationsLocalApi>()));
  gh.lazySingleton<_i80.UnitsApiService>(
      () => _i80.UnitsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i81.UnitsRepository>(() => _i82.UnitsRepositoryImpl(
      get<_i19.NetworkInfo>(), get<_i80.UnitsApiService>()));
  gh.lazySingleton<_i83.UpdateDistributionArea>(() =>
      _i83.UpdateDistributionArea(get<_i23.DistributionAreasRepository>()));
  gh.lazySingleton<_i84.UpdateEmail>(
      () => _i84.UpdateEmail(get<_i66.ProfileRepository>()));
  gh.factory<_i85.UpdateEmailCubit>(
      () => _i85.UpdateEmailCubit(get<_i84.UpdateEmail>()));
  gh.lazySingleton<_i86.UpdateInstitutionItem>(
      () => _i86.UpdateInstitutionItem(get<_i49.ItemsRepository>()));
  gh.lazySingleton<_i87.UpdateInstitutionOrder>(() =>
      _i87.UpdateInstitutionOrder(get<_i35.InstitutionOrdersRepository>()));
  gh.lazySingleton<_i88.UpdatePhoneNumber>(
      () => _i88.UpdatePhoneNumber(get<_i66.ProfileRepository>()));
  gh.factory<_i89.UpdatePhoneVerificationCubit>(() =>
      _i89.UpdatePhoneVerificationCubit(
          get<_i88.UpdatePhoneNumber>(), get<_i77.SmsAutoFill>()));
  gh.lazySingleton<_i90.UpdateProfile>(
      () => _i90.UpdateProfile(get<_i66.ProfileRepository>()));
  gh.lazySingleton<_i91.UserInstitutionsServiceApi>(() =>
      _i91.UserInstitutionsServiceApiImpl(
          get<_i11.FirebaseAuth>(), get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i92.UserOrdersApiService>(
      () => _i92.UserOrdersApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i93.UserOrdersRepository>(() =>
      _i94.UserOrdersRepositoryImpl(
          get<_i92.UserOrdersApiService>(), get<_i19.NetworkInfo>()));
  gh.lazySingleton<_i95.WorkIstitutionsApiService>(
      () => _i95.WorkIstitutionsApiServiceImpl(get<_i6.FirebaseFirestore>()));
  gh.lazySingleton<_i96.AcceptJobOffer>(
      () => _i96.AcceptJobOffer(get<_i52.JobsOffersRepository>()));
  gh.factory<_i97.AccountInfoCubit>(
      () => _i97.AccountInfoCubit(get<_i90.UpdateProfile>()));
  gh.lazySingleton<_i98.AddDistributionArea>(
      () => _i98.AddDistributionArea(get<_i23.DistributionAreasRepository>()));
  gh.lazySingleton<_i99.AddInstitutionItem>(
      () => _i99.AddInstitutionItem(get<_i49.ItemsRepository>()));
  gh.lazySingleton<_i100.AddInstitutionReceipt>(() =>
      _i100.AddInstitutionReceipt(get<_i38.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i101.AddNewCity>(
      () => _i101.AddNewCity(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i102.AddNewGovernate>(
      () => _i102.AddNewGovernate(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i103.AddNewNeighborhood>(
      () => _i103.AddNewNeighborhood(get<_i7.AddressSuggestionsRepository>()));
  gh.lazySingleton<_i104.AddRefAndInstitutionItem>(
      () => _i104.AddRefAndInstitutionItem(get<_i49.ItemsRepository>()));
  gh.lazySingleton<_i105.AddUnitToReference>(
      () => _i105.AddUnitToReference(get<_i81.UnitsRepository>()));
  gh.lazySingleton<_i106.AddressesRepository>(() =>
      _i107.AddressesRepositoryImpl(get<_i10.AddressesServiceApi>(),
          get<_i19.NetworkInfo>(), get<_i9.AddressesLocalDataSource>()));
  gh.lazySingleton<_i108.AuthApiService>(() => _i108.AuthApiServiceImpl(
      firebaseAuth: get<_i64.FirebaseAuth>(),
      googleSignIn: get<_i109.GoogleSignIn>(),
      facebookAuth: get<_i110.FacebookAuth>(),
      firestore: get<_i65.FirebaseFirestore>(),
      cloudFunctions: get<_i111.FirebaseFunctions>(),
      firebaseMessaging: get<_i26.FirebaseMessaging>(),
      sharedPreferences: get<_i13.SharedPreferences>()));
  gh.lazySingleton<_i112.AuthRepository>(() => _i113.AuthRepositoryImpl(
      authApiService: get<_i108.AuthApiService>(),
      authLocalService: get<_i12.AuthLocalService>(),
      networkInfo: get<_i43.NetworkInfo>()));
  gh.lazySingleton<_i114.CheckIfSeenBefore>(
      () => _i114.CheckIfSeenBefore(get<_i78.StartUpRepository>()));
  gh.lazySingleton<_i115.DeclineJobOffer>(
      () => _i115.DeclineJobOffer(get<_i52.JobsOffersRepository>()));
  gh.lazySingleton<_i116.DeleteDistributionArea>(() =>
      _i116.DeleteDistributionArea(get<_i23.DistributionAreasRepository>()));
  gh.lazySingleton<_i117.GetAddressInstitutions>(
      () => _i117.GetAddressInstitutions(get<_i41.InstitutionsRepository>()));
  gh.lazySingleton<_i118.GetAddresses>(
      () => _i118.GetAddresses(get<_i106.AddressesRepository>()));
  gh.lazySingleton<_i119.GetCurrentLocation>(
      () => _i119.GetCurrentLocation(get<_i106.AddressesRepository>()));
  gh.lazySingleton<_i120.GetEmployees>(
      () => _i120.GetEmployees(get<_i71.RecruitmentRepository>()));
  gh.lazySingleton<_i121.GetInstitutionItems>(
      () => _i121.GetInstitutionItems(get<_i49.ItemsRepository>()));
  gh.lazySingleton<_i122.GetInstitutionOrders>(() =>
      _i122.GetInstitutionOrders(get<_i35.InstitutionOrdersRepository>()));
  gh.lazySingleton<_i123.GetInstitutionReceipts>(() =>
      _i123.GetInstitutionReceipts(get<_i38.InstitutionReceiptsRepository>()));
  gh.lazySingleton<_i124.GetItems>(
      () => _i124.GetItems(get<_i47.ItemsRepository>()));
  gh.lazySingleton<_i125.GetJobsOffers>(
      () => _i125.GetJobsOffers(get<_i52.JobsOffersRepository>()));
  gh.lazySingleton<_i126.GetSentJobOffers>(
      () => _i126.GetSentJobOffers(get<_i71.RecruitmentRepository>()));
  gh.lazySingleton<_i127.GetUnitSuggestions>(
      () => _i127.GetUnitSuggestions(get<_i81.UnitsRepository>()));
  gh.lazySingleton<_i128.GetUserOrders>(
      () => _i128.GetUserOrders(get<_i93.UserOrdersRepository>()));
  gh.factory<_i129.InstitutionItemsCubit>(
      () => _i129.InstitutionItemsCubit(get<_i121.GetInstitutionItems>()));
  gh.factory<_i130.InstitutionJobsOffersCubit>(() =>
      _i130.InstitutionJobsOffersCubit(get<_i126.GetSentJobOffers>(),
          get<_i76.SendJobOffer>(), get<_i74.RemoveJobOffer>()));
  gh.factory<_i131.InstitutionOrdersCubit>(() => _i131.InstitutionOrdersCubit(
      get<_i122.GetInstitutionOrders>(), get<_i87.UpdateInstitutionOrder>()));
  gh.factory<_i132.InstitutionReceiptsCubit>(() =>
      _i132.InstitutionReceiptsCubit(
          get<_i121.GetInstitutionItems>(),
          get<_i123.GetInstitutionReceipts>(),
          get<_i100.AddInstitutionReceipt>()));
  gh.factory<_i133.InstitutionsCubit>(
      () => _i133.InstitutionsCubit(get<_i117.GetAddressInstitutions>()));
  gh.factory<_i134.ItemsCubit>(() => _i134.ItemsCubit(get<_i124.GetItems>()));
  gh.factory<_i135.JobsOffersCubit>(() => _i135.JobsOffersCubit(
      get<_i125.GetJobsOffers>(),
      get<_i96.AcceptJobOffer>(),
      get<_i115.DeclineJobOffer>()));
  gh.lazySingleton<_i136.LinkEmailAndPassword>(
      () => _i136.LinkEmailAndPassword(get<_i112.AuthRepository>()));
  gh.factory<_i137.LocationWidgetCubit>(
      () => _i137.LocationWidgetCubit(get<_i119.GetCurrentLocation>()));
  gh.lazySingleton<_i138.LogOut>(
      () => _i138.LogOut(get<_i112.AuthRepository>()));
  gh.factory<_i139.NotificationsBloc>(
      () => _i139.NotificationsBloc(get<_i59.NotificationsRepository>()));
  gh.lazySingleton<_i140.PlaceOrder>(
      () => _i140.PlaceOrder(get<_i93.UserOrdersRepository>()));
  gh.lazySingleton<_i141.RegisterFcmDeviceToken>(
      () => _i141.RegisterFcmDeviceToken(get<_i78.StartUpRepository>()));
  gh.lazySingleton<_i142.RemoveAddress>(
      () => _i142.RemoveAddress(get<_i106.AddressesRepository>()));
  gh.factory<_i143.SelectLocationMapBloc>(
      () => _i143.SelectLocationMapBloc(get<_i119.GetCurrentLocation>()));
  gh.lazySingleton<_i144.SignInWithPhone>(
      () => _i144.SignInWithPhone(get<_i112.AuthRepository>()));
  gh.factory<_i145.StartUpCubit>(
      () => _i145.StartUpCubit(get<_i114.CheckIfSeenBefore>()));
  gh.lazySingleton<_i146.UpdateAddress>(
      () => _i146.UpdateAddress(get<_i106.AddressesRepository>()));
  gh.lazySingleton<_i147.UserInstitutionsRepository>(() =>
      _i148.UserInstitutionsRepositoryImpl(
          get<_i91.UserInstitutionsServiceApi>(), get<_i43.NetworkInfo>()));
  gh.factory<_i149.UserOrdersBloc>(() => _i149.UserOrdersBloc(
      get<_i128.GetUserOrders>(), get<_i87.UpdateInstitutionOrder>()));
  gh.lazySingleton<_i150.VerifyPhoneNumber>(
      () => _i150.VerifyPhoneNumber(get<_i112.AuthRepository>()));
  gh.lazySingleton<_i151.WorkInstitutionRepository>(() =>
      _i152.WorkInstitutionRepositoryImpl(
          get<_i95.WorkIstitutionsApiService>(), get<_i19.NetworkInfo>()));
  gh.lazySingleton<_i153.AddAddress>(
      () => _i153.AddAddress(get<_i106.AddressesRepository>()));
  gh.factory<_i154.AddEmailVerificationCubit>(() =>
      _i154.AddEmailVerificationCubit(
          get<_i136.LinkEmailAndPassword>(), get<_i77.SmsAutoFill>()));
  gh.lazySingleton<_i155.AddFirstAddress>(
      () => _i155.AddFirstAddress(get<_i106.AddressesRepository>()));
  gh.lazySingleton<_i156.AddFirstAddressCubit>(
      () => _i156.AddFirstAddressCubit(get<_i155.AddFirstAddress>()));
  gh.lazySingleton<_i157.AddInstitution>(
      () => _i157.AddInstitution(get<_i147.UserInstitutionsRepository>()));
  gh.factory<_i158.AddInstitutionCubit>(
      () => _i158.AddInstitutionCubit(get<_i157.AddInstitution>()));
  gh.factory<_i159.AddItemBloc>(() => _i159.AddItemBloc(
      get<_i75.SearchItem>(),
      get<_i99.AddInstitutionItem>(),
      get<_i104.AddRefAndInstitutionItem>(),
      get<_i86.UpdateInstitutionItem>()));
  gh.factory<_i160.AddUnitBloc>(() => _i160.AddUnitBloc(
      get<_i127.GetUnitSuggestions>(), get<_i105.AddUnitToReference>()));
  gh.factory<_i161.AddressesCubit>(
      () => _i161.AddressesCubit(get<_i118.GetAddresses>()));
  gh.factory<_i162.AppBloc>(
      () => _i162.AppBloc(authRepository: get<_i112.AuthRepository>()));
  gh.factory<_i163.ClientInstitutionsCubit>(() => _i163.ClientInstitutionsCubit(
      get<_i28.GetClientInstitutionItems>(), get<_i140.PlaceOrder>()));
  gh.factory<_i164.EmployeesCubit>(() => _i164.EmployeesCubit(
      get<_i120.GetEmployees>(), get<_i73.RemoveEmployee>()));
  gh.lazySingleton<_i165.GetUserInstitutions>(
      () => _i165.GetUserInstitutions(get<_i147.UserInstitutionsRepository>()));
  gh.lazySingleton<_i166.GetWorkInstitutions>(
      () => _i166.GetWorkInstitutions(get<_i151.WorkInstitutionRepository>()));
  gh.factory<_i167.LinkEmailAndPasswordCubit>(
      () => _i167.LinkEmailAndPasswordCubit(get<_i150.VerifyPhoneNumber>()));
  gh.lazySingleton<_i168.UpdateInstitution>(
      () => _i168.UpdateInstitution(get<_i147.UserInstitutionsRepository>()));
  gh.factory<_i169.UpdatePhoneCubit>(
      () => _i169.UpdatePhoneCubit(get<_i150.VerifyPhoneNumber>()));
  gh.factory<_i170.UserInstitutionsCubit>(
      () => _i170.UserInstitutionsCubit(get<_i165.GetUserInstitutions>()));
  gh.factory<_i171.WorkInstitutionsCubit>(
      () => _i171.WorkInstitutionsCubit(get<_i166.GetWorkInstitutions>()));
  return get;
}

class _$RegisterModule extends _i172.RegisterModule {}
