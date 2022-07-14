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

class GeoPresentationLocalizations {
  GeoPresentationLocalizations();

  static GeoPresentationLocalizations? _current;

  static GeoPresentationLocalizations get current {
    assert(_current != null,
        'No instance of GeoPresentationLocalizations was loaded. Try to initialize the GeoPresentationLocalizations delegate before accessing GeoPresentationLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<GeoPresentationLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = GeoPresentationLocalizations();
      GeoPresentationLocalizations._current = instance;

      return instance;
    });
  }

  static GeoPresentationLocalizations of(BuildContext context) {
    final instance = GeoPresentationLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of GeoPresentationLocalizations present in the widget tree. Did you add GeoPresentationLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static GeoPresentationLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<GeoPresentationLocalizations>(
        context, GeoPresentationLocalizations);
  }

  /// `Add address`
  String get addAddress {
    return Intl.message(
      'Add address',
      name: 'addAddress',
      desc: '',
      args: [],
    );
  }

  /// `Edit address`
  String get editAddress {
    return Intl.message(
      'Edit address',
      name: 'editAddress',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `County`
  String get county {
    return Intl.message(
      'County',
      name: 'county',
      desc: '',
      args: [],
    );
  }

  /// `governate`
  String get governate {
    return Intl.message(
      'governate',
      name: 'governate',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `district / village / neighbourhood`
  String get districtVillageNeighbourhood {
    return Intl.message(
      'district / village / neighbourhood',
      name: 'districtVillageNeighbourhood',
      desc: '',
      args: [],
    );
  }

  /// `description`
  String get description {
    return Intl.message(
      'description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Current location`
  String get currentLocation {
    return Intl.message(
      'Current location',
      name: 'currentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select location`
  String get selectLocation {
    return Intl.message(
      'Select location',
      name: 'selectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Save address`
  String get saveAddress {
    return Intl.message(
      'Save address',
      name: 'saveAddress',
      desc: '',
      args: [],
    );
  }

  /// `Delivery location`
  String get deliveryLocation {
    return Intl.message(
      'Delivery location',
      name: 'deliveryLocation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
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

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<GeoPresentationLocalizations> {
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
  Future<GeoPresentationLocalizations> load(Locale locale) =>
      GeoPresentationLocalizations.load(locale);
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
