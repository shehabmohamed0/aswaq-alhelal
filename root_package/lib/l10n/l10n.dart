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
