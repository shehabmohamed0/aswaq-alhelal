part of 'add_institution_cubit.dart';

enum AddInstitutionStatus { initial, loading, failure, success }

class AddInstitutionState extends Equatable {
  final int step;
  final List<FormzStatus> stepFormStatus;
  // step 0
  final MinimumLengthString officialName;
  final MinimumLengthString nickName;
  // step 1
  final List<Email> emails;
  final List<PhoneNumber> phoneNumbers;
  // step 2
  final RequiredObject<FullAddressDetails> address;

  final AddInstitutionStatus status;
  final String? errorMessage;
  final InstitutionProfile? addedInstitution;
  const AddInstitutionState({
    this.step = 0,
    this.stepFormStatus = const [
      FormzStatus.pure,
      FormzStatus.pure,
      FormzStatus.pure
    ],
    this.officialName = const MinimumLengthString.pure(2),
    this.nickName = const MinimumLengthString.pure(2),
    this.emails = const [],
    this.phoneNumbers = const [],
    this.address = const RequiredObject.pure(),
    this.status = AddInstitutionStatus.initial,
    this.errorMessage,
    this.addedInstitution,
  });

  AddInstitutionState copyWith(
      {int? step,
      List<FormzStatus>? stepFormStatus,
      MinimumLengthString? officialName,
      MinimumLengthString? nickName,
      List<Email>? emails,
      List<PhoneNumber>? phoneNumbers,
      RequiredObject<FullAddressDetails>? address,
      AddInstitutionStatus? status,
      String? errorMessage,
      InstitutionProfile? addedInstitution}) {
    return AddInstitutionState(
        step: step ?? this.step,
        stepFormStatus: stepFormStatus ?? this.stepFormStatus,
        officialName: officialName ?? this.officialName,
        nickName: nickName ?? this.nickName,
        emails: emails ?? this.emails,
        phoneNumbers: phoneNumbers ?? this.phoneNumbers,
        address: address ?? this.address,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        addedInstitution: addedInstitution ?? addedInstitution);
  }

  @override
  List<Object?> get props => [
        step,
        stepFormStatus,
        officialName,
        nickName,
        emails,
        phoneNumbers,
        address,
        status,
        errorMessage,
        addedInstitution
      ];
}
