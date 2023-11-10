import 'package:aswaqalhelal/l10n/l10n.dart';

import '../failure.dart';

class UserNotFoundFailure extends Failure {
  const UserNotFoundFailure._(String message) : super(message);

  factory UserNotFoundFailure() {
    final message =
        AppLocalizations.current.thePhoneNumberDoesNotCorrespondToAnyUser;
    return UserNotFoundFailure._(message);
  }
}
