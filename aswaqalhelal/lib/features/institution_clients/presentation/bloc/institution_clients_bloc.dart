import 'dart:async';

import 'package:aswaqalhelal/core/failures/institution_clients/client_exsists_failure.dart';
import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/institution_clients/user_not_found_failure.dart';
import '../../../../core/form_inputs/name.dart';
import '../../../../core/form_inputs/phone_number.dart';
import '../../../../core/form_inputs/required_object.dart';
import '../../../../core/utils/phone_number_parser.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../../institution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../domain/entities/institution_client.dart';
import '../../domain/repositories/institution_clients_repository.dart';
import '../../domain/usecases/add_institution_clinet.dart';
import '../../domain/usecases/get_user_by_phone_number.dart';

part 'institution_clients_bloc.freezed.dart';
part 'institution_clients_event.dart';
part 'institution_clients_state.dart';

@injectable
class InstitutionClientsBloc
    extends Bloc<InstitutionClientsEvent, InstitutionClientsState> {
  InstitutionClientsBloc(
    this._getUserByPhoneNumber,
    this._addInstitutionClient,
  ) : super(const InstitutionClientsState()) {
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<NameChanged>(_onNameChanged);
    on<NewPhoneNumberClicked>(_onNewPhoneNumberClicked);
    on<UserProfileSelected>(_onUserProfileSelected);
    on<RemoveSelectionButtonClicked>(_onRemoveSelectionButtonClicked);
    on<AddButtonClicked>(_onAddButtonClicked);
  }

  final GetUserByPhoneNumber _getUserByPhoneNumber;
  final AddInstitutionClient _addInstitutionClient;

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

  FutureOr<void> _onNameChanged(
      NameChanged event, Emitter<InstitutionClientsState> emit) {
    emit(state.copyWith(name: Name.dirty(event.name)));
  }

  FutureOr<void> _onNewPhoneNumberClicked(
      NewPhoneNumberClicked event, Emitter<InstitutionClientsState> emit) {
    emit(
      state.copyWith(
        addingNonExistentProfile: true,
        userProfile: none(),
        status: InstitutionClientsStatus.newPhoneNumberSelected,
      ),
    );
  }

  FutureOr<void> _onUserProfileSelected(
      UserProfileSelected event, Emitter<InstitutionClientsState> emit) {
    emit(
      state.copyWith(
        userProfile: some(event.userProfile),
        status: InstitutionClientsStatus.newUserSelected,
        addingNonExistentProfile: false,
      ),
    );
  }

  FutureOr<void> _onRemoveSelectionButtonClicked(
      RemoveSelectionButtonClicked event,
      Emitter<InstitutionClientsState> emit) {
    emit(
      const InstitutionClientsState(
        status: InstitutionClientsStatus.clientSelectionRemoved,
      ),
    );
  }

  FutureOr<void> _onAddButtonClicked(
      AddButtonClicked event, Emitter<InstitutionClientsState> emit) async {
    if (state.status == InstitutionClientsStatus.loading) return;
    emit(state.copyWith(status: InstitutionClientsStatus.loading));
    final eitherClientOrFailure = await _addInstitutionClient(
      params: state.addingNonExistentProfile
          ? AddInstitutionClientParams(
              institutionId: event.institutionId,
              phoneNumber: state.phoneNumber.value,
              name: state.name.value,
            )
          : AddInstitutionClientParams(
              institutionId: event.institutionId,
              profile: state.userProfile.toNullable(),
            ),
    );
    eitherClientOrFailure.fold(
      (failure) => emit(
        state.copyWith(
          status: InstitutionClientsStatus.failure,
          errorMessage: failure is ServerFailure
              ? failure.message
              : (failure as ClientExsistsBeforeFailure).message,
        ),
      ),
      (client) => emit(state.copyWith(
        addedClient: client,
        status: InstitutionClientsStatus.success,
      )),
    );
  }
}
