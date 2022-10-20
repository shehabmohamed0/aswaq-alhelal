import 'package:root_package/packages/firebase_remote_config.dart';
import 'package:root_package/packages/injectable.dart';

abstract class StartupRemoteApi {
  Future<bool> needsAForcedUpdate();
}

@LazySingleton(as: StartupRemoteApi)
class StartupRemoteApiImpl extends StartupRemoteApi {
  final FirebaseRemoteConfig _remoteConfig;

  StartupRemoteApiImpl(this._remoteConfig);
  @override
  Future<bool> needsAForcedUpdate() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: Duration.zero,
    ));

    await _remoteConfig.fetchAndActivate();

    return _remoteConfig.getBool('needsAForcedUpdate');
  }
}
