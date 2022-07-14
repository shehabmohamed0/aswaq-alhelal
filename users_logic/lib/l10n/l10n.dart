// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:root_package/packages/multiple_localization.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class UsersLogicLocalizations {
  UsersLogicLocalizations();

  static UsersLogicLocalizations? _current;

  static UsersLogicLocalizations get current {
    assert(_current != null,
        'No instance of UsersLogicLocalizations was loaded. Try to initialize the UsersLogicLocalizations delegate before accessing UsersLogicLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();
 static Future<UsersLogicLocalizations> load(Locale locale) {
    return MultipleLocalizations.load(
      initializeMessages,
      locale,
      (l) => UsersLogicLocalizations(),
      setDefaultLocale: true,
    );
  }


  static UsersLogicLocalizations of(BuildContext context) {
    final instance = UsersLogicLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of UsersLogicLocalizations present in the widget tree. Did you add UsersLogicLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static UsersLogicLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<UsersLogicLocalizations>(
        context, UsersLogicLocalizations);
  }

  /// `The Email has already been linked to the user.`
  String get theEmailHasAlreadyBeenLinkedToTheUser {
    return Intl.message(
      'The Email has already been linked to the user.',
      name: 'theEmailHasAlreadyBeenLinkedToTheUser',
      desc: '',
      args: [],
    );
  }

  /// `provider\'s credential is not valid.`
  String get providersCredentialIsNotValid {
    return Intl.message(
      'provider\\\'s credential is not valid.',
      name: 'providersCredentialIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `credential already exists among your users.`
  String get emailAlreadyExistsAmongYourUsers {
    return Intl.message(
      'credential already exists among your users.',
      name: 'emailAlreadyExistsAmongYourUsers',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid.`
  String get invalidEmail {
    return Intl.message(
      'Email is not valid.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists for that email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'An account already exists for that email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Operation is not allowed.  Please contact support.`
  String get operationIsNotAllowedPleaseContactSupport {
    return Intl.message(
      'Operation is not allowed.  Please contact support.',
      name: 'operationIsNotAllowedPleaseContactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Sign in first to apply these changes.`
  String get signInFirstToApplyTheseChanges {
    return Intl.message(
      'Sign in first to apply these changes.',
      name: 'signInFirstToApplyTheseChanges',
      desc: '',
      args: [],
    );
  }

  /// `Password is not strong enough.`
  String get passwordIsNotStrongEnough {
    return Intl.message(
      'Password is not strong enough.',
      name: 'passwordIsNotStrongEnough',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests.`
  String get tooManyRequests {
    return Intl.message(
      'Too many requests.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `An unknown failure occurred.`
  String get anUnknownFailureOccurred {
    return Intl.message(
      'An unknown failure occurred.',
      name: 'anUnknownFailureOccurred',
      desc: '',
      args: [],
    );
  }

  /// `The credential received is malformed or has expired.`
  String get theCredentialReceivedIsMalformedOrHasExpired {
    return Intl.message(
      'The credential received is malformed or has expired.',
      name: 'theCredentialReceivedIsMalformedOrHasExpired',
      desc: '',
      args: [],
    );
  }

  /// `This user has been disabled. Please contact support for help.`
  String get thisUserHasBeenDisabledPleaseContactSupportForHelp {
    return Intl.message(
      'This user has been disabled. Please contact support for help.',
      name: 'thisUserHasBeenDisabledPleaseContactSupportForHelp',
      desc: '',
      args: [],
    );
  }

  /// `The verification code received is invalid.`
  String get theVerificationCodeReceivedIsInvalid {
    return Intl.message(
      'The verification code received is invalid.',
      name: 'theVerificationCodeReceivedIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `The verification ID received is invalid.`
  String get theVerificationIdReceivedIsInvalid {
    return Intl.message(
      'The verification ID received is invalid.',
      name: 'theVerificationIdReceivedIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Please, check internet connection and try again.`
  String get pleaseCheckInternetConnectionAndTryAgain {
    return Intl.message(
      'Please, check internet connection and try again.',
      name: 'pleaseCheckInternetConnectionAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number.`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number.',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid or badly formatted.`
  String get emailIsNotValidOrBadlyFormatted {
    return Intl.message(
      'Email is not valid or badly formatted.',
      name: 'emailIsNotValidOrBadlyFormatted',
      desc: '',
      args: [],
    );
  }

  /// `Email is not found, please create an account.`
  String get emailIsNotFoundPleaseCreateAnAccount {
    return Intl.message(
      'Email is not found, please create an account.',
      name: 'emailIsNotFoundPleaseCreateAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password, please try again.`
  String get incorrectPasswordPleaseTryAgain {
    return Intl.message(
      'Incorrect password, please try again.',
      name: 'incorrectPasswordPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `The email and password you entered does\'t belong this user.`
  String get theEmailAndPasswordYouEnteredDoestBelongThisUser {
    return Intl.message(
      'The email and password you entered does\\\'t belong this user.',
      name: 'theEmailAndPasswordYouEnteredDoestBelongThisUser',
      desc: '',
      args: [],
    );
  }

  /// `The credential given does not correspond to any existing user.`
  String get theCredentialGivenDoesNotCorrespondToAnyExistingUser {
    return Intl.message(
      'The credential given does not correspond to any existing user.',
      name: 'theCredentialGivenDoesNotCorrespondToAnyExistingUser',
      desc: '',
      args: [],
    );
  }

  /// `The new email is invalid.`
  String get theNewEmailIsInvalid {
    return Intl.message(
      'The new email is invalid.',
      name: 'theNewEmailIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `The password is not correct.`
  String get thePasswordIsNotCorrect {
    return Intl.message(
      'The password is not correct.',
      name: 'thePasswordIsNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Email is already used by another user.`
  String get emailIsAlreadyUsedByAnotherUser {
    return Intl.message(
      'Email is already used by another user.',
      name: 'emailIsAlreadyUsedByAnotherUser',
      desc: '',
      args: [],
    );
  }

  /// `The user\'s last sign-in time does not meet the security threshold.`
  String get theUsersLastSigninTimeDoesNotMeetTheSecurity {
    return Intl.message(
      'The user\\\'s last sign-in time does not meet the security threshold.',
      name: 'theUsersLastSigninTimeDoesNotMeetTheSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Session expired.`
  String get sessionExpired {
    return Intl.message(
      'Session expired.',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Phone number already in use.`
  String get phoneNumberAlreadyInUse {
    return Intl.message(
      'Phone number already in use.',
      name: 'phoneNumberAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong.',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `The verification code you entered is invalid.`
  String get theVerificationCodeYouEnteredIsInvalid {
    return Intl.message(
      'The verification code you entered is invalid.',
      name: 'theVerificationCodeYouEnteredIsInvalid',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<UsersLogicLocalizations> {
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
  Future<UsersLogicLocalizations> load(Locale locale) =>
      UsersLogicLocalizations.load(locale);
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
