import 'package:flutter/foundation.dart';
import 'package:root_package/core/failures/failures.dart';
import 'package:root_package/locator/locator.dart';
import 'package:users_logic/l10n/l10n.dart';

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class SignInWithEmailAndPasswordFailure implements Failure {
  /// The associated error message.
  final String message;

  SignInWithEmailAndPasswordFailure._(this.message);

  /// {@macro log_in_with_email_and_password_failure}
  factory SignInWithEmailAndPasswordFailure() {
    final intl = locator<UsersLogicLocalizations>();
    return SignInWithEmailAndPasswordFailure._(intl.anUnknownFailureOccurred);
  }

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory SignInWithEmailAndPasswordFailure.fromCode(String code) {
    final intl = locator<UsersLogicLocalizations>();

    switch (code) {
      case 'invalid-email':
        return SignInWithEmailAndPasswordFailure._(
          intl.emailIsNotValidOrBadlyFormatted,
        );
      case 'user-disabled':
        return SignInWithEmailAndPasswordFailure._(
          intl.thisUserHasBeenDisabledPleaseContactSupportForHelp,
        );
      case 'user-not-found':
        return SignInWithEmailAndPasswordFailure._(
          intl.emailIsNotFoundPleaseCreateAnAccount,
        );
      case 'wrong-password':
        return SignInWithEmailAndPasswordFailure._(
          intl.incorrectPasswordPleaseTryAgain,
        );
      case 'network-request-failed':
        return SignInWithEmailAndPasswordFailure._(
          intl.pleaseCheckInternetConnectionAndTryAgain,
        );

      default:
        return SignInWithEmailAndPasswordFailure();
    }
  }

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}
