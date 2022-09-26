import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:root_package/core/exceptions/exceptions.dart';
import 'package:root_package/packages/shared_preferences.dart';

import '../../../domain/entities/base_profile.dart';

abstract class AuthLocalService {
  ///get Current signin user
  ///
  ///throw [CacheException] if there is no user
  BaseProfile lastSelectedProfile();
  Future<void> saveCurrentProfile(BaseProfile baseProfile);
  Future<void> removeProfile(BaseProfile baseProfile);
}

@LazySingleton(as: AuthLocalService)
class AuthLocalServiceImpl implements AuthLocalService {
  final SharedPreferences _sharedPreferences;

  AuthLocalServiceImpl(this._sharedPreferences);

  @override
  BaseProfile lastSelectedProfile() {
    final string = _sharedPreferences.getString(LocalKeys.lastSelectedProfile);
    if (string == null) throw CacheException();
    final json = jsonDecode(string) as Map<String, dynamic>;
    return BaseProfile.fromJson(json);
  }

  @override
  Future<void> saveCurrentProfile(BaseProfile baseProfile) async {
    await _sharedPreferences.setString(
        LocalKeys.lastSelectedProfile, jsonEncode(baseProfile.toJson()));
  }

  @override
  Future<void> removeProfile(BaseProfile baseProfile) async {
    await _sharedPreferences.remove(LocalKeys.lastSelectedProfile);
  }
}

class LocalKeys {
  static const lastSelectedProfile = 'lastSelectedProfile';
  LocalKeys._();
}
