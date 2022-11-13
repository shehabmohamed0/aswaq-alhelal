import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/exceptions/exceptions.dart';
import '../../../domain/entities/base_profile.dart';

abstract class AuthLocalService {
  ///get Current signin user
  ///
  ///throw [CacheException] if there is no user
  String lastSelectedProfile();
  Future<void> saveCurrentProfile(BaseProfile baseProfile);
  Future<void> removeProfile(BaseProfile baseProfile);
}

@LazySingleton(as: AuthLocalService)
class AuthLocalServiceImpl implements AuthLocalService {
  final SharedPreferences _sharedPreferences;

  AuthLocalServiceImpl(this._sharedPreferences);

  @override
  String lastSelectedProfile() {
    final id = _sharedPreferences.getString(LocalKeys.selectedProfile);
    if (id == null) throw CacheException();
    return id;
  }

  @override
  Future<void> saveCurrentProfile(BaseProfile baseProfile) async {
    await _sharedPreferences.setString(
        LocalKeys.selectedProfile, baseProfile.id);
  }

  @override
  Future<void> removeProfile(BaseProfile baseProfile) async {
    await _sharedPreferences.remove(LocalKeys.selectedProfile);
  }
}

class LocalKeys {
  static const selectedProfile = 'lastSelectedProfile';
  LocalKeys._();
}
