import '../../models/user/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/core/services/cache_client.dart';
import 'package:root_package/core/exceptions/exceptions.dart';

abstract class AuthLocalService {
  ///get Current signin user
  ///
  ///throw [CacheException] if there is no user
  UserModel currentUser();
  void saveCurrentUser(UserModel userModel);
  void removeUser(UserModel userModel);
  

}

@LazySingleton(as: AuthLocalService)
class AuthLocalServiceImpl implements AuthLocalService {
  final CacheClient _cacheClient;
  AuthLocalServiceImpl(this._cacheClient);

  @override
  UserModel currentUser() {
    final userModel = _cacheClient.read<UserModel>(key: 'user');
    if (userModel == null) {
      throw CacheException();
    }
    return userModel;
  }

  @override
  void saveCurrentUser(UserModel userModel) {
    _cacheClient.write<UserModel>(key: LocalKeys.currentUser, value: userModel);
  }

  @override
  void removeUser(UserModel userModel) {}
}
class LocalKeys {
  static const currentUser = 'currentUser';
  LocalKeys._();
}
