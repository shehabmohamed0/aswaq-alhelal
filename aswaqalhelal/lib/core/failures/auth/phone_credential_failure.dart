import 'package:aswaqalhelal/l10n/l10n.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/locator/locator.dart';

class PhoneCredentialFailure implements Failure {
  final String message;

  PhoneCredentialFailure._(this.message);

  /// {@macro link_email_and_password_failure}
  factory PhoneCredentialFailure() {
    final intl = locator<AppLocalizations>();
    return PhoneCredentialFailure._(intl.anUnknownFailureOccurred);
  }

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory PhoneCredentialFailure.fromCode(String code) {
    final intl = locator<AppLocalizations>();
    switch (code) {
      case 'invalid-credential':
        return PhoneCredentialFailure._(
          intl.theCredentialReceivedIsMalformedOrHasExpired,
        );
      case 'operation-not-allowed':
        return PhoneCredentialFailure._(
          intl.operationIsNotAllowedPleaseContactSupport,
        );
      case 'user-disabled':
        return PhoneCredentialFailure._(
          intl.thisUserHasBeenDisabledPleaseContactSupportForHelp,
        );

      case 'invalid-verification-code':
        return PhoneCredentialFailure._(
          intl.theVerificationCodeYouEnteredIsInvalid,
        );
      case 'invalid-verification-id':
        return PhoneCredentialFailure._(
          intl.theVerificationIdReceivedIsInvalid,
        );
      case 'network-request-failed':
        return PhoneCredentialFailure._(
          intl.pleaseCheckInternetConnectionAndTryAgain,
        );
      case 'too-many-requests':
        return PhoneCredentialFailure._(
          intl.tooManyRequests,
        );
      case 'invalid-phone-number':
        return PhoneCredentialFailure._(
          intl.invalidPhoneNumber,
        );

      default:
        return PhoneCredentialFailure();
    }
  }

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
