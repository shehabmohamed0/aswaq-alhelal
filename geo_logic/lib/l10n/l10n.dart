// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:root_package/packages/multiple_localization.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class GeoLogicLocalizations {
  GeoLogicLocalizations();

  static GeoLogicLocalizations? _current;

  static GeoLogicLocalizations get current {
    assert(_current != null,
        'No instance of GeoLogicLocalizations was loaded. Try to initialize the GeoLogicLocalizations delegate before accessing GeoLogicLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();
static Future<GeoLogicLocalizations> load(Locale locale) {
    return MultipleLocalizations.load(
      initializeMessages,
      locale,
      (l) {
        final instance = GeoLogicLocalizations();
        GeoLogicLocalizations._current = instance;
        return instance;
      },
      setDefaultLocale: true,
    );
  }


  static GeoLogicLocalizations of(BuildContext context) {
    final instance = GeoLogicLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of GeoLogicLocalizations present in the widget tree. Did you add GeoLogicLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static GeoLogicLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<GeoLogicLocalizations>(
        context, GeoLogicLocalizations);
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<GeoLogicLocalizations> {
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
  Future<GeoLogicLocalizations> load(Locale locale) =>
      GeoLogicLocalizations.load(locale);
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
