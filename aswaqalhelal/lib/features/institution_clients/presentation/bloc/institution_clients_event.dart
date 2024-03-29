part of 'institution_clients_bloc.dart';

@freezed
class InstitutionClientsEvent with _$InstitutionClientsEvent {
  const factory InstitutionClientsEvent.phoneNumberChanged(
      {required String phoneNumber}) = PhoneNumberChanged;

  const factory InstitutionClientsEvent.nameChanged({required String name}) =
      NameChanged;

  const factory InstitutionClientsEvent.newPhoneNumberClicked() =
      NewPhoneNumberClicked;

  const factory InstitutionClientsEvent.userSelected(
      {required UserProfile userProfile}) = UserProfileSelected;

  const factory InstitutionClientsEvent.removeSelectionButtonClicked() =
      RemoveSelectionButtonClicked;

  const factory InstitutionClientsEvent.addButtonClicked(
      {required String institutionId}) = AddButtonClicked;
}
