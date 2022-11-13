// General failures
import 'package:aswaqalhelal/l10n/l10n.dart';

import 'package:aswaqalhelal/locator/locator.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  final String message;
  ServerFailure(this.message);

  factory ServerFailure.internetConnection() {
    final intl = locator<AppLocalizations>();
    return ServerFailure(intl.checkInternetConnection);
  }
  factory ServerFailure.general() {
    final intl = locator<AppLocalizations>();

    return ServerFailure(intl.somethingWentWrong);
  }
}
