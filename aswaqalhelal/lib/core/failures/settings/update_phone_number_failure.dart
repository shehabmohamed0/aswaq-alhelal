import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/locator/locator.dart';

import '../../../l10n/l10n.dart';

class UpdatePhoneNumberFailure implements Failure {
  final String message;

  UpdatePhoneNumberFailure._(this.message);

  factory UpdatePhoneNumberFailure() {
    return UpdatePhoneNumberFailure._('');
  }

  factory UpdatePhoneNumberFailure.fromCode(String code) {
    final intl = locator<AppLocalizations>();
    switch (code) {
      case 'invalid-verification-code':
        return UpdatePhoneNumberFailure._(
            intl.theVerificationCodeReceivedIsInvalid);
      case 'invalid-verification-id':
        return UpdatePhoneNumberFailure._(
          intl.theVerificationIdReceivedIsInvalid,
        );
      case 'session-expired':
        return UpdatePhoneNumberFailure._(
          intl.sessionExpired,
        );
      case 'credential-already-in-use':
        return UpdatePhoneNumberFailure._(
          intl.phoneNumberAlreadyInUse,
        );
      case 'network-request-failed':
        return UpdatePhoneNumberFailure._(
          intl.pleaseCheckInternetConnectionAndTryAgain,
        );
      case 'too-many-requests':
        return UpdatePhoneNumberFailure._(
          intl.tooManyRequests,
        );
      default:
        return UpdatePhoneNumberFailure();
    }
  }
  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}
