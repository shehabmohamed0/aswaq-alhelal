// General failures
import 'package:root_package/locator/locator.dart';

import '../../l10n/l10n.dart';
import 'failure.dart';

class ServerFailure extends Failure {
  final String message;
  ServerFailure(this.message);

  factory ServerFailure.internetConnection() {
    final intl = locator<RootPackageLocalizations>();
    return ServerFailure(intl.checkInternetConnection);
  }
  factory ServerFailure.general() {
    final intl = locator<RootPackageLocalizations>();

    return ServerFailure(intl.somethingWentWrong);
  }
}
