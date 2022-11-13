import '../failure.dart';

class SignInWithCredentialFailure implements Failure {
  /// The associated error message.
  final String message;

  /// {@macro log_in_with_google_failure}
  const SignInWithCredentialFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory SignInWithCredentialFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const SignInWithCredentialFailure(
          'Account exists with different credentials.',
        );
      case 'invalid-credential':
        return const SignInWithCredentialFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const SignInWithCredentialFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const SignInWithCredentialFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const SignInWithCredentialFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const SignInWithCredentialFailure(
          'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const SignInWithCredentialFailure(
          'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const SignInWithCredentialFailure(
          'The credential verification ID received is invalid.',
        );
      case 'network-request-failed':
        return const SignInWithCredentialFailure(
          'Please, check internet connection and try again.',
        );
      case 'too-many-requests':
        return const SignInWithCredentialFailure(
          'Too many requests, please try again later.',
        );
      case 'invalid-phone-number':
        return const SignInWithCredentialFailure(
          'Invalid phone number.',
        );

      default:
        return const SignInWithCredentialFailure();
    }
  }

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => true;
}

class GoogleSignInWithGoogleCanceledFailure implements Failure {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
