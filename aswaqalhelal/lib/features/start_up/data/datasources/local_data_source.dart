import 'package:root_package/packages/injectable.dart';
import 'package:root_package/packages/shared_preferences.dart';

abstract class NotificationsLocalApi {
  Future<bool> seenBefore();
}

@LazySingleton(as: NotificationsLocalApi)
class NotificationsLocalApiImpl extends NotificationsLocalApi {
  final SharedPreferences _sharedPreferences;

  NotificationsLocalApiImpl(this._sharedPreferences);
  @override
  Future<bool> seenBefore() async {
    final seenBefore =
        _sharedPreferences.getBool(LocalKeys.seenBefore) ?? false;
    if (!seenBefore) {
      await _sharedPreferences.setBool(LocalKeys.seenBefore, true);
    }
    return seenBefore;
  }
}

class LocalKeys {
  static const String seenBefore = 'seenBefore';
}
