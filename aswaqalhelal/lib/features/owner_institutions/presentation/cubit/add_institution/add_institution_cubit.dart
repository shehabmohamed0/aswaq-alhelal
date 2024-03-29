import 'package:aswaqalhelal/core/form_inputs/email.dart';
import 'package:aswaqalhelal/core/form_inputs/phone_number.dart';
import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:aswaqalhelal/core/failures/server_failure.dart';
import '../../../../../core/form_inputs/minimum_lenght_string.dart';
import 'package:aswaqalhelal/core/form_inputs/required_object.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/params/add_institution_params/add_institution_params.dart';
import '../../../../address_suggestions/domain/entities/entities.dart';
import '../../../../auth/domain/entities/user_profile.dart';
import '../../../domain/usecases/add_institution.dart';

part 'add_institution_state.dart';

@injectable
class AddInstitutionCubit extends Cubit<AddInstitutionState> {
  AddInstitutionCubit(this._addInstitution)
      : super(const AddInstitutionState());
  final AddInstitution _addInstitution;
  VoidCallback? onStepContinue() {
    return _onStep<VoidCallback?>(step0: () {
      if (state.officialName.valid && state.nickName.valid) {
        return () => emit(state.copyWith(step: 1));
      }
      return null;
    }, step1: () {
      if (_isEmailsPhoneNumbersValid()) {
        return () => emit(state.copyWith(step: 2));
      }
      return null;
    }, step2: () {
      if (state.address.valid &&
          _isEmailsPhoneNumbersValid() &&
          state.officialName.valid &&
          state.nickName.valid) {
        return _submit;
      }
      return null;
    });
  }

  Future<void> _submit() async {
    emit(state.copyWith(status: AddInstitutionStatus.loading));
    final either = await _addInstitution(
        params: AddInstitutionParams(
      officialName: state.officialName.value,
      nickName: state.nickName.value,
      emails: state.emails.map((e) => e.value).toList(),
      phoneNumbers: state.phoneNumbers.map((e) => e.value).toList(),
      addressDetails: state.address.value!,
    ));

    either.fold((failure) {
      failure as ServerFailure;
      emit(state.copyWith(
        status: AddInstitutionStatus.failure,
        errorMessage: failure.message,
      ));
    }, (institution) {
      emit(state.copyWith(
        status: AddInstitutionStatus.success,
        addedInstitution: institution,
      ));
    });
  }

  void previousStep() {
    if (state.step > 0) {
      emit(state.copyWith(step: state.step - 1));
    }
  }

  T _onStep<T>({
    required T Function() step0,
    required T Function() step1,
    required T Function() step2,
  }) {
    if (state.step == 0) {
      return step0();
    } else if (state.step == 1) {
      return step1();
    } else {
      return step2();
    }
  }

  bool _isEmailsPhoneNumbersValid() {
    final emailsState = Formz.validate(state.emails);
    final phoneNumbersState = Formz.validate(state.phoneNumbers);
    return emailsState == FormzStatus.valid &&
        phoneNumbersState == FormzStatus.valid;
  }

  void onStepTapped(int value) {
    emit(state.copyWith(step: value));
  }

  bool isActive(int index) {
    return index <= state.step;
  }

  void officialNameChanged(String value) {
    final newName = state.officialName.dirty(value);
    emit(state.copyWith(officialName: newName));
  }

  void nickNameChanged(String value) {
    final newName = state.nickName.dirty(value);
    emit(state.copyWith(nickName: newName));
  }

  void addEmail(Email email) {
    emit(state.copyWith(emails: List.of(state.emails)..add(email)));
  }

  void addPhoneNumber(PhoneNumber phoneNumber) {
    emit(state.copyWith(
        phoneNumbers: List.of(state.phoneNumbers)..add(phoneNumber)));
  }

  void removeEmail(Email email) {
    emit(state.copyWith(
        emails: List.of(state.emails)
          ..removeWhere(
            (element) => element.value == email.value,
          )));
  }

  void removePhoneNumber(PhoneNumber phoneNumber) {
    emit(state.copyWith(
        phoneNumbers: List.of(state.phoneNumbers)
          ..removeWhere(
            (element) => element.value == phoneNumber.value,
          )));
  }

  void addressChanged(FullAddressDetails? addressDetails) {
    emit(state.copyWith(address: RequiredObject.dirty(addressDetails)));
  }

  void initailPhoneNumber(UserProfile user) {
    emit(state.copyWith(phoneNumbers: [PhoneNumber.dirty(user.phoneNumber)]));
  }
}
