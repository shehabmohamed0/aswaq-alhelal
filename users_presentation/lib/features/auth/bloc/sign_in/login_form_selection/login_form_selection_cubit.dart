import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'login_form_selection_state.dart';
@injectable
class LoginFormSelectionCubit extends Cubit<LoginFormSelectionState> {
  LoginFormSelectionCubit() : super(LoginFormPhone());

  void showPhoneForm() {
    emit(LoginFormPhone());
  }

  void showEmaileForm() {
    emit(LoginFormEmail());
  }
}
