part of 'login_form_selection_cubit.dart';

abstract class LoginFormSelectionState extends Equatable {
  const LoginFormSelectionState();

  @override
  List<Object> get props => [];
}

class LoginFormPhone extends LoginFormSelectionState {}

class  LoginFormEmail extends LoginFormSelectionState {}
