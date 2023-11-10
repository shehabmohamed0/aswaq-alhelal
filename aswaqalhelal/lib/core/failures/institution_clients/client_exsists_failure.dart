import '../../../l10n/l10n.dart';
import '../failure.dart';

class ClientExsistsBeforeFailure extends Failure {
  const ClientExsistsBeforeFailure._(super.message);
  factory ClientExsistsBeforeFailure() {
    return ClientExsistsBeforeFailure._(
        AppLocalizations.current.thisClientAlreadyBeenAdded);
  }
}
