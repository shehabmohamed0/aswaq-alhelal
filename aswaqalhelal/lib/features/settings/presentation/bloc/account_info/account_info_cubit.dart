import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/form_inputs/name.dart';

import '../../../../../core/params/settings/update_profile_params.dart';
import '../../../../auth/domain/entities/user.dart';
import '../../../domain/usecases/update_profile.dart';

part 'account_info_state.dart';

@injectable
class AccountInfoCubit extends Cubit<AccountInfoState> {
  AccountInfoCubit(this._updateProfile) : super(const AccountInfoState());
  final UpdateProfile _updateProfile;

  void initialize(User user) {
    emit(
      state.copyWith(
          name: Name.dirty(user.name ?? ''),
          birthDate: user.birthDate,
          gender: user.gender),
    );
  }

  void nameChanged(String name) {
    final newName = Name.dirty(name);
    emit(state.copyWith(name: newName, status: Formz.validate([newName])));
  }

  void genderChanged(String? gender) {
    emit(state.copyWith(
        gender: gender ?? '', status: Formz.validate([state.name])));
  }

  void birthDateChanged(DateTime birthDate, TextEditingController controller) {
    controller.text = DateFormat.yMd().format(birthDate).toString();
    emit(state.copyWith(
        birthDate: birthDate, status: Formz.validate([state.name])));
  }

  Future<void> updateProfile() async {
    if (!state.status.isValid) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final either = await _updateProfile(
        params: UpdateProfileParams(
      name: state.name.value,
      birthDate: state.birthDate,
      gender: state.gender,
    ));

    either.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: failure.message));
        }
      },
      (success) => emit(state.copyWith(status: FormzStatus.submissionSuccess)),
    );
  }
}
