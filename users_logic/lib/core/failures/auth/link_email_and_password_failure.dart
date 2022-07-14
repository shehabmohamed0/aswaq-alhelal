import 'package:root_package/core/failures/failures.dart';
import 'package:root_package/locator/locator.dart';
import '../../../l10n/l10n.dart';

class LinkEmailAndPasswordFailure implements Failure {
  final String message;

  LinkEmailAndPasswordFailure._(this.message);

  /// {@macro link_email_and_password_failure}
  factory LinkEmailAndPasswordFailure() {
    final intl = locator<UsersLogicLocalizations>();
    return LinkEmailAndPasswordFailure._(intl.anUnknownFailureOccurred);
  }

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LinkEmailAndPasswordFailure.fromCode(String code) {
    final intl = locator<UsersLogicLocalizations>();
    switch (code) {
      case 'provider-already-linked':
        return LinkEmailAndPasswordFailure._(
          intl.theEmailHasAlreadyBeenLinkedToTheUser,
        );
      case 'invalid-credential':
        return LinkEmailAndPasswordFailure._(
          intl.providersCredentialIsNotValid,
        );
      case 'credential-already-in-use':
        return LinkEmailAndPasswordFailure._(
          intl.emailAlreadyExistsAmongYourUsers,
        );
      case 'invalid-email':
        return LinkEmailAndPasswordFailure._(
          intl.invalidEmail,
        );
      case 'email-already-in-use':
        return LinkEmailAndPasswordFailure._(
          intl.emailAlreadyInUse,
        );
      case 'operation-not-allowed':
        return LinkEmailAndPasswordFailure._(
          intl.operationIsNotAllowedPleaseContactSupport,
        );
      case 'requires-recent-login':
        return LinkEmailAndPasswordFailure._(
          intl.signInFirstToApplyTheseChanges,
        );
      case 'weak-password':
        return LinkEmailAndPasswordFailure._(
          intl.passwordIsNotStrongEnough,
        );
      case 'too-many-requests':
        return LinkEmailAndPasswordFailure._(
          intl.tooManyRequests,
        );
      case 'network-request-failed':
        return LinkEmailAndPasswordFailure._(
          intl.pleaseCheckInternetConnectionAndTryAgain,
        );
      default:
        return LinkEmailAndPasswordFailure();
    }
  }

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
/*invalid-verification-id:
Thrown if the credential is a [PhoneAuthProvider.credential] and the verification ID of the credential is not valid.
 */