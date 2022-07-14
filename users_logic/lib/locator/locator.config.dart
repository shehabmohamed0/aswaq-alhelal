// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:cloud_functions/cloud_functions.dart' as _i18;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:root_package/core/services/cache_client.dart' as _i4;
import 'package:root_package/core/services/network_info.dart' as _i12;
import 'package:root_package/root_package.dart' as _i21;
import 'package:sms_autofill/sms_autofill.dart' as _i13;

import '../features/auth/data/datasources/local/auth_local_service.dart' as _i3;
import '../features/auth/data/datasources/remote/auth_api_service.dart' as _i17;
import '../features/auth/data/repositories/auth_repository_impl.dart' as _i20;
import '../features/auth/domain/repositories/auth_repository.dart' as _i19;
import '../features/auth/domain/usecases/is_phone_exists_usecase.dart' as _i22;
import '../features/auth/domain/usecases/link_email_and_password.dart' as _i23;
import '../features/auth/domain/usecases/log_out.dart' as _i24;
import '../features/auth/domain/usecases/phone_sign_up.dart' as _i25;
import '../features/auth/domain/usecases/sign_in_with_email_and_password.dart'
    as _i26;
import '../features/auth/domain/usecases/sign_in_with_facebook.dart' as _i27;
import '../features/auth/domain/usecases/sign_in_with_google.dart' as _i28;
import '../features/auth/domain/usecases/sign_in_with_phone.dart' as _i29;
import '../features/auth/domain/usecases/verify_phone_number.dart' as _i30;
import '../features/settings/data/datasources/profile_api_service.dart' as _i7;
import '../features/settings/data/repositories/profile_repository_impl.dart'
    as _i11;
import '../features/settings/domain/repositories/profile_repository.dart'
    as _i10;
import '../features/settings/domain/usecases/update_email.dart' as _i14;
import '../features/settings/domain/usecases/update_phone_number.dart' as _i15;
import '../features/settings/domain/usecases/update_profile.dart' as _i16;
import 'register_module.dart' as _i31; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AuthLocalService>(
      () => _i3.AuthLocalServiceImpl(get<_i4.CacheClient>()));
  gh.factory<_i5.FacebookAuth>(() => registerModule.facebookAuth);
  gh.factory<_i6.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i7.ProfileApiService>(() => _i7.ProfileApiServiceImpl(
      get<_i8.FirebaseAuth>(), get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i10.ProfileRepository>(() => _i11.ProfileRepositoryImpl(
      get<_i7.ProfileApiService>(), get<_i12.NetworkInfo>()));
  gh.factory<_i13.SmsAutoFill>(() => registerModule.smsAutoFill);
  gh.lazySingleton<_i14.UpdateEmail>(
      () => _i14.UpdateEmail(get<_i10.ProfileRepository>()));
  gh.lazySingleton<_i15.UpdatePhoneNumber>(
      () => _i15.UpdatePhoneNumber(get<_i10.ProfileRepository>()));
  gh.lazySingleton<_i16.UpdateProfile>(
      () => _i16.UpdateProfile(get<_i10.ProfileRepository>()));
  gh.lazySingleton<_i17.AuthApiService>(() => _i17.AuthApiServiceImpl(
      firebaseAuth: get<_i8.FirebaseAuth>(),
      googleSignIn: get<_i6.GoogleSignIn>(),
      facebookAuth: get<_i5.FacebookAuth>(),
      firestore: get<_i9.FirebaseFirestore>(),
      cloudFunctions: get<_i18.FirebaseFunctions>()));
  gh.lazySingleton<_i19.AuthRepository>(() => _i20.AuthRepositoryImpl(
      authApiService: get<_i17.AuthApiService>(),
      authLocalService: get<_i3.AuthLocalService>(),
      networkInfo: get<_i21.NetworkInfo>()));
  gh.factory<_i22.IsPhoneExistsUsecase>(
      () => _i22.IsPhoneExistsUsecase(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i23.LinkEmailAndPassword>(
      () => _i23.LinkEmailAndPassword(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i24.LogOut>(() => _i24.LogOut(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i25.PhoneSignUp>(
      () => _i25.PhoneSignUp(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i26.SignInWithEmailAndPassword>(
      () => _i26.SignInWithEmailAndPassword(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i27.SignInWithFacebook>(
      () => _i27.SignInWithFacebook(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i28.SignInWithGoogle>(
      () => _i28.SignInWithGoogle(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i29.SignInWithPhone>(
      () => _i29.SignInWithPhone(get<_i19.AuthRepository>()));
  gh.lazySingleton<_i30.VerifyPhoneNumber>(
      () => _i30.VerifyPhoneNumber(get<_i19.AuthRepository>()));
  return get;
}

class _$RegisterModule extends _i31.RegisterModule {}
