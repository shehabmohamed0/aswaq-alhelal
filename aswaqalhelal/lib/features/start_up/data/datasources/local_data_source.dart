import 'package:root_package/packages/injectable.dart';
import 'package:root_package/packages/shared_preferences.dart';

abstract class LocalDataSource {
  Future<bool> seenBefore();
}

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource {
  final SharedPreferences _sharedPreferences;

  LocalDataSourceImpl(this._sharedPreferences);
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
