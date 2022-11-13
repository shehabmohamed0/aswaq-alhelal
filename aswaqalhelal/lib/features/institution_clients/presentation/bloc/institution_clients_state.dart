part of 'institution_clients_bloc.dart';

@freezed
class InstitutionClientsState with _$InstitutionClientsState {
  const factory InstitutionClientsState({
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    @Default(false) bool isAddingClientWithoutUserProfile,
    @Default(Iterable.empty()) Iterable<UserProfile> userSuggestions,
    @Default(AutoSuggestionState.emptyText) AutoSuggestionState suggestionState,
    @Default(RequiredObject<UserProfile>.pure())
        RequiredObject<UserProfile> userProfile,
    @Default(InstitutionClientsStatus.initial) InstitutionClientsStatus status,
  }) = _InstitutionClientsState;
}

enum InstitutionClientsStatus {
  initial,
  newPhoneNumberSelected,
  newUserSelected,
  clientSelectionRemoved,
}
