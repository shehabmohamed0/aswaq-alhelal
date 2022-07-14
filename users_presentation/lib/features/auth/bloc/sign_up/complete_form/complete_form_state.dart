part of 'complete_form_cubit.dart';

class CompleteFormState extends Equatable {
  const CompleteFormState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.status = FormzStatus.pure,
      this.errorMessage});
  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;
  @override
  List<Object> get props => [email, password, status];

  CompleteFormState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return CompleteFormState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
