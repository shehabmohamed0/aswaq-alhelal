import 'dart:developer';

import 'package:aswaqalhelal/core/params/update_institution_params.dart';
import 'package:aswaqalhelal/features/institutions/domain/usecases/update_institution.dart';
import 'package:bloc/bloc.dart';
import 'package:root_package/core/form_inputs/required_string.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/formz.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart';

import '../../../../../core/params/add_institution_params.dart';
import '../../../domain/entities/institution.dart';
import '../../../domain/usecases/add_institution.dart';

part 'add_institution_state.dart';

@injectable
class AddInstitutionCubit extends Cubit<AddInstitutionState> {
  AddInstitutionCubit(this._addInstitution, this._updateInstitution)
      : super(const AddInstitutionState());

  final AddInstitution _addInstitution;
  final UpdateInstitution _updateInstitution;

  void officialNameChanged(String val) {
    final newOfficialName = RequiredString.dirty(val);
    emit(state.copyWith(officialName: newOfficialName));
  }

  void initEdit(Institution institution) {
    emit(
      AddInstitutionState(
        isEdit: true,
        id: institution.id,
        officialName: RequiredString.dirty(institution.officialName),
        commercialName: RequiredString.dirty(institution.commercialName),
        brandName: RequiredString.dirty(institution.brandName),
        nickName: RequiredString.dirty(institution.nickname),
        emails: institution.emails.map((e) => Email.dirty(e)).toList(),
        phoneNumbers:
            institution.phoneNumbers.map((e) => PhoneNumber.dirty(e)).toList(),
      ),
    );
  }

  void commercialNameChanged(String val) {
    final newCommercialName = RequiredString.dirty(val);
    emit(state.copyWith(commercialName: newCommercialName));
  }

  void brandNameChanged(String val) {
    final newBrandName = RequiredString.dirty(val);
    emit(state.copyWith(brandName: newBrandName));
  }

  void nickNameChanged(String val) {
    final newNickName = RequiredString.dirty(val);
    emit(state.copyWith(nickName: newNickName));
  }

  void addNewEmail() {
    final newList = List.of(state.emails)..add(const Email.pure());
    emit(state.copyWith(emails: newList));
  }

  void emailChanged(int index, String val) {
    final newList = List.of(state.emails);
    newList[index] = Email.dirty(val);
    emit(state.copyWith(emails: newList));
  }

  void addNewPhoneNumber() {
    log(state.phoneNumbers.toString());
    final newList = List.of(state.phoneNumbers)..add(const PhoneNumber.pure());
    log(newList.toString());

    emit(state.copyWith(phoneNumbers: newList));
  }

  void phoneNumberChanged(int index, String val) {
    final newList = List.of(state.phoneNumbers);
    newList[index] = PhoneNumber.dirty(val);
    emit(state.copyWith(phoneNumbers: newList));
  }

  void deletePhoneNumber(int index) {
    final newList = List.of(state.phoneNumbers)..removeAt(index);
    emit(state.copyWith(phoneNumbers: newList));
  }

  void deleteEmail(int index) {
    final newList = List.of(state.emails)..removeAt(index);
    emit(state.copyWith(emails: newList));
  }

  Future<void> submit() async {
    if (state.status == FormzStatus.submissionInProgress) {
      return;
    }
    final status = Formz.validate([
      state.officialName,
      state.commercialName,
      state.brandName,
      state.nickName,
      ...state.emails,
      ...state.phoneNumbers
    ]);
    if (status == FormzStatus.valid) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      if (state.isEdit) {
        await _updateCurrentInstitution(state.id!);
      } else {
        await _addNewInstitution();
      }
    } else {
      _emitNewDirtyData();
    }
  }

  void _emitNewDirtyData() {
    emit(
      AddInstitutionState(
          officialName: RequiredString.dirty(state.officialName.value),
          brandName: RequiredString.dirty(state.brandName.value),
          commercialName: RequiredString.dirty(state.commercialName.value),
          nickName: RequiredString.dirty(state.nickName.value),
          emails:
              List.of(state.emails.map((email) => Email.dirty(email.value))),
          phoneNumbers: List.of(state.phoneNumbers
              .map((phoneNumber) => PhoneNumber.dirty(phoneNumber.value)))),
    );
  }

  Future<void> _addNewInstitution() async {
    final either = await _addInstitution(
        params: AddInstitutionParams(state.toInstitution()));
    either.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: failure.message,
            ),
          );
        }
      },
      (institution) {
        emit(state.copyWith(
            status: FormzStatus.submissionSuccess, institution: institution));
      },
    );
  }

  Future<void> _updateCurrentInstitution(String id) async {
    final either = await _updateInstitution(
        params: UpdateInstitutionParams(state.toInstitution(id)));
    either.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(
            state.copyWith(
              status: FormzStatus.submissionFailure,
              errorMessage: failure.message,
            ),
          );
        }
      },
      (institution) {
        emit(state.copyWith(
          status: FormzStatus.submissionSuccess,
          institution: institution,
        ));
      },
    );
  }
}
