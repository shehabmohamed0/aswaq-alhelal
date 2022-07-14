import 'package:root_package/core/failures/failures.dart';
import 'package:root_package/locator/locator.dart';
import 'package:users_logic/l10n/l10n.dart';

/// {@template sign_up_with_email_and_password_exception}
/// Thrown if during the sign up process if a failure occurs.
/// {@endtemplate}
class SignUpWithEmailAndPasswordFailure implements Failure {
  SignUpWithEmailAndPasswordFailure._(this.message);

  /// {@macro sign_up_with_email_and_password_failure}
  factory SignUpWithEmailAndPasswordFailure() {
    final intl = locator<UsersLogicLocalizations>();
    return SignUpWithEmailAndPasswordFailure._(intl.anUnknownFailureOccurred);
  }

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    final intl = locator<UsersLogicLocalizations>();

    switch (code) {
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure._(
          intl.emailIsNotValidOrBadlyFormatted,
        );
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure._(
          intl.thisUserHasBeenDisabledPleaseContactSupportForHelp,
        );
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure._(
          intl.emailAlreadyInUse,
        );
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure._(
          intl.operationIsNotAllowedPleaseContactSupport,
        );
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure._(
          intl.passwordIsNotStrongEnough,
        );
      case 'network-request-failed':
        return SignUpWithEmailAndPasswordFailure._(
          intl.pleaseCheckInternetConnectionAndTryAgain,
        );
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}
