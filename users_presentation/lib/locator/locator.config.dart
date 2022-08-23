// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sms_autofill/sms_autofill.dart' as _i7;
import 'package:users_logic/features/auth/domain/usecases/usecases.dart' as _i6;
import 'package:users_logic/features/auth/domain/usecases/verify_phone_number.dart'
    as _i21;
import 'package:users_logic/features/settings/domain/usecases/update_email.dart'
    as _i19;
import 'package:users_logic/features/settings/domain/usecases/update_phone_number.dart'
    as _i23;
import 'package:users_logic/features/settings/domain/usecases/update_profile.dart'
    as _i4;
import 'package:users_logic/users_logic.dart' as _i9;

import '../features/auth/bloc/app_status/app_bloc.dart' as _i8;
import '../features/auth/bloc/sign_in/email_sign_in_form/email_sign_in_form_cubit.dart'
    as _i11;
import '../features/auth/bloc/sign_in/login_form_selection/login_form_selection_cubit.dart'
    as _i13;
import '../features/auth/bloc/sign_in/phone_sign_in_form/phone_sign_in_form_cubit.dart'
    as _i14;
import '../features/auth/bloc/sign_in/phone_sign_in_form/phone_sign_in_verification_cubit.dart'
    as _i15;
import '../features/auth/bloc/sign_up/complete_form/complete_form_cubit.dart'
    as _i10;
import '../features/auth/bloc/sign_up/phone_sign_up_verification_cubit.dart'
    as _i16;
import '../features/auth/bloc/sign_up/sign_up_form/sign_up_form_cubit.dart'
    as _i17;
import '../features/settings/bloc/account_info/account_info_cubit.dart' as _i3;
import '../features/settings/bloc/add_email/add_email_cubit.dart' as _i12;
import '../features/settings/bloc/add_email/add_email_verification_cubit.dart'
    as _i5;
import '../features/settings/bloc/change_phone/update_phone_cubit.dart' as _i20;
import '../features/settings/bloc/change_phone/update_phone_verification_cubit.dart'
    as _i22;
import '../features/settings/bloc/cubit/update_email_cubit.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountInfoCubit>(
      () => _i3.AccountInfoCubit(get<_i4.UpdateProfile>()));
  gh.factory<_i5.AddEmailVerificationCubit>(() => _i5.AddEmailVerificationCubit(
      get<_i6.LinkEmailAndPassword>(), get<_i7.SmsAutoFill>()));
  gh.factory<_i8.AppBloc>(
      () => _i8.AppBloc(authRepository: get<_i9.AuthRepository>()));
  gh.factory<_i10.CompleteFormCubit>(
      () => _i10.CompleteFormCubit(get<_i9.LinkEmailAndPassword>()));
  gh.factory<_i11.EmailSignInFormCubit>(
      () => _i11.EmailSignInFormCubit(get<_i9.SignInWithEmailAndPassword>()));
  gh.factory<_i12.LinkEmailAndPasswordCubit>(
      () => _i12.LinkEmailAndPasswordCubit(get<_i6.VerifyPhoneNumber>()));
  gh.factory<_i13.LoginFormSelectionCubit>(
      () => _i13.LoginFormSelectionCubit());
  gh.factory<_i14.PhoneSignInFormCubit>(() => _i14.PhoneSignInFormCubit(
      get<_i9.VerifyPhoneNumber>(),
      get<_i9.IsPhoneExistsUsecase>(),
      get<_i9.SignInWithPhone>()));
  gh.factory<_i15.PhoneSignInVerificationCubit>(() =>
      _i15.PhoneSignInVerificationCubit(
          get<_i9.SignInWithPhone>(), get<_i7.SmsAutoFill>()));
  gh.factory<_i16.PhoneSignUpVerificationCubit>(() =>
      _i16.PhoneSignUpVerificationCubit(
          get<_i9.PhoneSignUp>(), get<_i7.SmsAutoFill>()));
  gh.factory<_i17.SignUpFormCubit>(() => _i17.SignUpFormCubit(
      get<_i9.VerifyPhoneNumber>(), get<_i9.IsPhoneExistsUsecase>()));
  gh.factory<_i18.UpdateEmailCubit>(
      () => _i18.UpdateEmailCubit(get<_i19.UpdateEmail>()));
  gh.factory<_i20.UpdatePhoneCubit>(
      () => _i20.UpdatePhoneCubit(get<_i21.VerifyPhoneNumber>()));
  gh.factory<_i22.UpdatePhoneVerificationCubit>(() =>
      _i22.UpdatePhoneVerificationCubit(
          get<_i23.UpdatePhoneNumber>(), get<_i7.SmsAutoFill>()));
  return get;
}
