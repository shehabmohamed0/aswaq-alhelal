part of 'institution_clients_bloc.dart';

@freezed
class InstitutionClientsState with _$InstitutionClientsState {
  const factory InstitutionClientsState({
    @Default(PhoneNumber.pure()) PhoneNumber phoneNumber,
    @Default(Name.pure()) Name name,
    @Default(None<UserProfile>()) Option<UserProfile> userProfile,
    @Default(false) bool addingNonExistentProfile,
    @Default(Iterable.empty()) Iterable<UserProfile> userSuggestions,
    @Default(AutoSuggestionState.emptyText) AutoSuggestionState suggestionState,
    @Default(InstitutionClientsStatus.initial) InstitutionClientsStatus status,
    @Default('') String errorMessage,
    InstitutionClient? addedClient,
  }) = _InstitutionClientsState;
}

enum InstitutionClientsStatus {
  initial,
  newPhoneNumberSelected,
  newUserSelected,
  clientSelectionRemoved,
  loading,
  success,
  failure,
}
