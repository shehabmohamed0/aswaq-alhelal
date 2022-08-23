part of 'add_email_cubit.dart';

class LinkEmailAndPasswordState extends Equatable {
  const LinkEmailAndPasswordState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.verificationId,
  });
  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;
  final String? verificationId;
  LinkEmailAndPasswordState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
    String? verificationId,
  }) {
    return LinkEmailAndPasswordState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      verificationId: verificationId ?? verificationId,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
