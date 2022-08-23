// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multiple_localization/multiple_localization.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class UsersPresentationLocalizations {
  UsersPresentationLocalizations();

  static UsersPresentationLocalizations? _current;

  static UsersPresentationLocalizations get current {
    assert(_current != null,
        'No instance of UsersPresentationLocalizations was loaded. Try to initialize the UsersPresentationLocalizations delegate before accessing UsersPresentationLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<UsersPresentationLocalizations> load(Locale locale) {
    return MultipleLocalizations.load(
      initializeMessages,
      locale,
      (l) {
        final instance = UsersPresentationLocalizations();
        UsersPresentationLocalizations._current = instance;
        return instance;
      },
      setDefaultLocale: true,
    );
  }

  static UsersPresentationLocalizations of(BuildContext context) {
    final instance = UsersPresentationLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of UsersPresentationLocalizations present in the widget tree. Did you add UsersPresentationLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static UsersPresentationLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<UsersPresentationLocalizations>(
        context, UsersPresentationLocalizations);
  }

  /// `Phone number is not registered.`
  String get phoneNumberIsNotRegistered {
    return Intl.message(
      'Phone number is not registered.',
      name: 'phoneNumberIsNotRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Phone number already is use.`
  String get phoneNumberAlreadyIsUse {
    return Intl.message(
      'Phone number already is use.',
      name: 'phoneNumberAlreadyIsUse',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Not registered yet?`
  String get notRegisteredYet {
    return Intl.message(
      'Not registered yet?',
      name: 'notRegisteredYet',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account.`
  String get createAnAccount {
    return Intl.message(
      'Create an Account.',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Authentication Failure`
  String get authenticationFailure {
    return Intl.message(
      'Authentication Failure',
      name: 'authenticationFailure',
      desc: '',
      args: [],
    );
  }

  /// `Login Account`
  String get accountLogin {
    return Intl.message(
      'Login Account',
      name: 'accountLogin',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get signUp {
    return Intl.message(
      'SIGN UP',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get otp {
    return Intl.message(
      'OTP',
      name: 'otp',
      desc: '',
      args: [],
    );
  }

  /// `Verification code`
  String get verificationCode {
    return Intl.message(
      'Verification code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `We have sent the code verifiaction to\nYour Mobile Number`
  String get weHaveSentTheCodeVerifiactionTonyourMobileNumber {
    return Intl.message(
      'We have sent the code verifiaction to\nYour Mobile Number',
      name: 'weHaveSentTheCodeVerifiactionTonyourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `failed`
  String get failed {
    return Intl.message(
      'failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Verifiy`
  String get verifiy {
    return Intl.message(
      'Verifiy',
      name: 'verifiy',
      desc: '',
      args: [],
    );
  }

  /// `Firestore error`
  String get firestoreError {
    return Intl.message(
      'Firestore error',
      name: 'firestoreError',
      desc: '',
      args: [],
    );
  }

  /// `Account info`
  String get accountInfo {
    return Intl.message(
      'Account info',
      name: 'accountInfo',
      desc: '',
      args: [],
    );
  }

  /// `loading...`
  String get loading {
    return Intl.message(
      'loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `update failed`
  String get updateFailed {
    return Intl.message(
      'update failed',
      name: 'updateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Gender (optional)`
  String get genderOptional {
    return Intl.message(
      'Gender (optional)',
      name: 'genderOptional',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Not specified`
  String get notSpecified {
    return Intl.message(
      'Not specified',
      name: 'notSpecified',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Change phone number`
  String get changePhoneNumber {
    return Intl.message(
      'Change phone number',
      name: 'changePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Change number failure`
  String get changeNumberFailure {
    return Intl.message(
      'Change number failure',
      name: 'changeNumberFailure',
      desc: '',
      args: [],
    );
  }

  /// `phone has been updated successfully`
  String get phoneHasBeenUpdatedSuccessfully {
    return Intl.message(
      'phone has been updated successfully',
      name: 'phoneHasBeenUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Contact info`
  String get contactInfo {
    return Intl.message(
      'Contact info',
      name: 'contactInfo',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailAddress {
    return Intl.message(
      'Email address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `No email linked to the account.`
  String get noEmailLinkedToTheAccount {
    return Intl.message(
      'No email linked to the account.',
      name: 'noEmailLinkedToTheAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone info`
  String get phoneInfo {
    return Intl.message(
      'Phone info',
      name: 'phoneInfo',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Update email`
  String get updateEmail {
    return Intl.message(
      'Update email',
      name: 'updateEmail',
      desc: '',
      args: [],
    );
  }

  /// `Update email failed.`
  String get updateEmailFailed {
    return Intl.message(
      'Update email failed.',
      name: 'updateEmailFailed',
      desc: '',
      args: [],
    );
  }

  /// `New email`
  String get newEmail {
    return Intl.message(
      'New email',
      name: 'newEmail',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get currentPassword {
    return Intl.message(
      'Current password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `update`
  String get update {
    return Intl.message(
      'update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get verifiybuttontext {
    return Intl.message(
      'Login',
      name: 'verifiybuttontext',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get addresses {
    return Intl.message(
      'Addresses',
      name: 'addresses',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<UsersPresentationLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<UsersPresentationLocalizations> load(Locale locale) =>
      UsersPresentationLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
