import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/locator/locator.dart';

import '../../../l10n/l10n.dart';

class UpdateEmailFailure implements Failure {
  final String message;

  UpdateEmailFailure._(this.message);
  factory UpdateEmailFailure() {
    final intl = locator<AppLocalizations>();
    return UpdateEmailFailure._(intl.anUnknownFailureOccurred);
  }

  factory UpdateEmailFailure.fromCode(String code) {
    final intl = locator<AppLocalizations>();

    switch (code) {
      case 'user-mismatch':
        return UpdateEmailFailure._(
          intl.theEmailAndPasswordYouEnteredDoestBelongThisUser,
        );
      case 'user-not-found':
        return UpdateEmailFailure._(
          intl.theCredentialGivenDoesNotCorrespondToAnyExistingUser,
        );
      case 'invalid-email':
        return UpdateEmailFailure._(
          intl.theNewEmailIsInvalid,
        );
      case 'wrong-password':
        return UpdateEmailFailure._(
          intl.thePasswordIsNotCorrect,
        );
      case 'email-already-in-use':
        return UpdateEmailFailure._(
          intl.emailIsAlreadyUsedByAnotherUser,
        );
      case 'requires-recent-login':
        return UpdateEmailFailure._(
          intl.theUsersLastSigninTimeDoesNotMeetTheSecurity,
        );
      case 'too-many-requests':
        return UpdateEmailFailure._(
          intl.tooManyRequests,
        );
      case 'network-request-failed':
        return UpdateEmailFailure._(
          intl.pleaseCheckInternetConnectionAndTryAgain,
        );
      default:
        return UpdateEmailFailure();
    }
  }
  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}
