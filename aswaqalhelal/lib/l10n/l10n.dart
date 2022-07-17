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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();
  
  static Future<AppLocalizations> load(Locale locale) {
    return MultipleLocalizations.load(
      initializeMessages,
      locale,
      (l) {
        final instance = AppLocalizations();
        AppLocalizations._current = instance;
        return instance;
      },
      setDefaultLocale: true,
    );
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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

  /// `invalid amount.`
  String get invalidAmount {
    return Intl.message(
      'invalid amount.',
      name: 'invalidAmount',
      desc: '',
      args: [],
    );
  }

  /// `invalid Code.`
  String get invalidCode {
    return Intl.message(
      'invalid Code.',
      name: 'invalidCode',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
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

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Aswaq Alhelal`
  String get aswaqLhelal {
    return Intl.message(
      'Aswaq Alhelal',
      name: 'aswaqLhelal',
      desc: '',
      args: [],
    );
  }

  /// `No image`
  String get noImage {
    return Intl.message(
      'No image',
      name: 'noImage',
      desc: '',
      args: [],
    );
  }

  /// `Uploaded succeffully`
  String get uploadedSucceffully {
    return Intl.message(
      'Uploaded succeffully',
      name: 'uploadedSucceffully',
      desc: '',
      args: [],
    );
  }

  /// `uploading Failed`
  String get uploadingFailed {
    return Intl.message(
      'uploading Failed',
      name: 'uploadingFailed',
      desc: '',
      args: [],
    );
  }

  /// `Update image`
  String get updateImage {
    return Intl.message(
      'Update image',
      name: 'updateImage',
      desc: '',
      args: [],
    );
  }

  /// `CURRENCY CONVERTER`
  String get currencyConverter {
    return Intl.message(
      'CURRENCY CONVERTER',
      name: 'currencyConverter',
      desc: '',
      args: [],
    );
  }

  /// `someThing went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'someThing went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `incorrect number`
  String get incorrectNumber {
    return Intl.message(
      'incorrect number',
      name: 'incorrectNumber',
      desc: '',
      args: [],
    );
  }

  /// `Switch Currencies`
  String get switchCurrencies {
    return Intl.message(
      'Switch Currencies',
      name: 'switchCurrencies',
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
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
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
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
