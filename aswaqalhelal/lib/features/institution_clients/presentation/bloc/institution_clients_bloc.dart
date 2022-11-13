import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:aswaqalhelal/core/form_inputs/required_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/institution_clients/get_user_by_phone_number_failure.dart';
import '../../../../core/form_inputs/phone_number.dart';
import '../../../../core/utils/phone_number_parser.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../../institution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../domain/repositories/institution_clients_repository.dart';
import '../../domain/usecases/get_user_by_phone_number.dart';

part 'institution_clients_bloc.freezed.dart';
part 'institution_clients_event.dart';
part 'institution_clients_state.dart';

@injectable
class InstitutionClientsBloc
    extends Bloc<InstitutionClientsEvent, InstitutionClientsState> {
  InstitutionClientsBloc(
    this._getUserByPhoneNumber,
  ) : super(const InstitutionClientsState()) {
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<NewPhoneNumberClicked>(_onNewPhoneNumberClicked);
    on<UserProfileSelected>(_onUserProfileSelected);
    on<RemoveSelectionButtonClicked>(_onRemoveSelectionButtonClicked);
  }

  final GetUserByPhoneNumber _getUserByPhoneNumber;

  FutureOr<void> _onPhoneNumberChanged(PhoneNumberChanged event, emit) async {
    final String phoneNumber =
        await PhoneNumberParser.getParsedPhoneNumber(event.phoneNumber, 'EG') ??
            '';
    final newPhoneNumber = PhoneNumber.dirty(phoneNumber);
    if (newPhoneNumber.invalid) {
      emit(state.copyWith(
          suggestionState: AutoSuggestionState.emptyText,
          phoneNumber: newPhoneNumber));
      return;
    }

    emit(state.copyWith(
      phoneNumber: newPhoneNumber,
      suggestionState: AutoSuggestionState.loading,
    ));

    final either = await _getUserByPhoneNumber(
      params: GetUserByPhoneNumberParams(
        phoneNumber: newPhoneNumber.value,
      ),
    );
    either.fold(
      (failure) => emit(
        state.copyWith(
          suggestionState: failure is UserNotFoundFailure
              ? AutoSuggestionState.loaded
              : AutoSuggestionState.error,
          userSuggestions: const Iterable.empty(),
        ),
      ),
      (userProfile) => emit(
        state.copyWith(
          suggestionState: AutoSuggestionState.loaded,
          userSuggestions: [userProfile],
        ),
      ),
    );
  }

  FutureOr<void> _onNewPhoneNumberClicked(
      NewPhoneNumberClicked event, Emitter<InstitutionClientsState> emit) {
    emit(
      state.copyWith(
        isAddingClientWithoutUserProfile: true,
        userProfile: const RequiredObject.dirty(null),
        status: InstitutionClientsStatus.newPhoneNumberSelected,
      ),
    );
  }

  FutureOr<void> _onUserProfileSelected(
      UserProfileSelected event, Emitter<InstitutionClientsState> emit) {
    emit(
      state.copyWith(
        userProfile: RequiredObject.dirty(event.userProfile),
        status: InstitutionClientsStatus.newUserSelected,
      ),
    );
  }

  FutureOr<void> _onRemoveSelectionButtonClicked(
      RemoveSelectionButtonClicked event,
      Emitter<InstitutionClientsState> emit) {
    emit(const InstitutionClientsState(
      status: InstitutionClientsStatus.clientSelectionRemoved,
    ));
  }
}
