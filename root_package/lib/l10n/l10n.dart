// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class RootPackageLocalizations {
  RootPackageLocalizations();

  static RootPackageLocalizations? _current;

  static RootPackageLocalizations get current {
    assert(_current != null,
        'No instance of RootPackageLocalizations was loaded. Try to initialize the RootPackageLocalizations delegate before accessing RootPackageLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<RootPackageLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = RootPackageLocalizations();
      RootPackageLocalizations._current = instance;

      return instance;
    });
  }

  static RootPackageLocalizations of(BuildContext context) {
    final instance = RootPackageLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of RootPackageLocalizations present in the widget tree. Did you add RootPackageLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static RootPackageLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<RootPackageLocalizations>(
        context, RootPackageLocalizations);
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Invalid email address.`
  String get invalidEmailAddress {
    return Intl.message(
      'Invalid email address.',
      name: 'invalidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Invalid user name.`
  String get invalidName {
    return Intl.message(
      'Invalid user name.',
      name: 'invalidName',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 character.`
  String get invalidPassword {
    return Intl.message(
      'Password must be at least 8 character.',
      name: 'invalidPassword',
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

  /// `The phone number is already registered.`
  String get phoneNumberIsAlreadyRegistered {
    return Intl.message(
      'The phone number is already registered.',
      name: 'phoneNumberIsAlreadyRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Please, check internet connection.`
  String get checkInternetConnection {
    return Intl.message(
      'Please, check internet connection.',
      name: 'checkInternetConnection',
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

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload the image.`
  String get failedToUploadTheImage {
    return Intl.message(
      'Failed to upload the image.',
      name: 'failedToUploadTheImage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload the file.`
  String get failedToUploadTheFile {
    return Intl.message(
      'Failed to upload the file.',
      name: 'failedToUploadTheFile',
      desc: '',
      args: [],
    );
  }

  /// `Failed to upload the images.`
  String get failedToUploadTheImages {
    return Intl.message(
      'Failed to upload the images.',
      name: 'failedToUploadTheImages',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least {howMany, plural, one{1 character} other{{howMany} characters}}`
  String mustBeAtLeastNumberCharacter(num howMany) {
    return Intl.message(
      'Must be at least ${Intl.plural(howMany, one: '1 character', other: '$howMany characters')}',
      name: 'mustBeAtLeastNumberCharacter',
      desc: '',
      args: [howMany],
    );
  }

  /// `Zero is an invalid number.`
  String get zeroIsAnInvalidNumber {
    return Intl.message(
      'Zero is an invalid number.',
      name: 'zeroIsAnInvalidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Accepts Integers only.`
  String get acceptsIntegersOnly {
    return Intl.message(
      'Accepts Integers only.',
      name: 'acceptsIntegersOnly',
      desc: '',
      args: [],
    );
  }

  /// `The number can not be negative.`
  String get theNumberCanNotBeNegative {
    return Intl.message(
      'The number can not be negative.',
      name: 'theNumberCanNotBeNegative',
      desc: '',
      args: [],
    );
  }

  /// `Invalid number.`
  String get invalidNumber {
    return Intl.message(
      'Invalid number.',
      name: 'invalidNumber',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<RootPackageLocalizations> {
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
  Future<RootPackageLocalizations> load(Locale locale) =>
      RootPackageLocalizations.load(locale);
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
