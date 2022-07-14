part of 'update_email_cubit.dart';

class UpdateEmailState extends Equatable {
  const UpdateEmailState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });
  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  UpdateEmailState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return UpdateEmailState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage];
}
