part of 'add_institution_cubit.dart';

class AddInstitutionState extends Equatable {
  final RequiredString officialName;
  final RequiredString commercialName;
  final RequiredString brandName;
  final RequiredString nickName;
  final List<Email> emails;
  final List<PhoneNumber> phoneNumbers;
  final FormzStatus status;
  final String? errorMessage;
  final Institution? institution;
  final bool isEdit;
  final String? id;

  const AddInstitutionState({
    this.officialName = const RequiredString.pure(),
    this.commercialName = const RequiredString.pure(),
    this.brandName = const RequiredString.pure(),
    this.nickName = const RequiredString.pure(),
    this.emails = const [Email.pure()],
    this.phoneNumbers = const [PhoneNumber.pure()],
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.institution,
    this.isEdit = false,
    this.id,
  });

  @override
  List<Object?> get props {
    return [
      officialName,
      commercialName,
      brandName,
      nickName,
      emails,
      phoneNumbers,
      status,
      errorMessage,
      institution,
      isEdit,
      id
    ];
  }

  AddInstitutionState copyWith({
    RequiredString? officialName,
    RequiredString? commercialName,
    RequiredString? brandName,
    RequiredString? nickName,
    List<Email>? emails,
    List<PhoneNumber>? phoneNumbers,
    FormzStatus? status,
    String? errorMessage,
    Institution? institution,
  }) {
    return AddInstitutionState(
      officialName: officialName ?? this.officialName,
      commercialName: commercialName ?? this.commercialName,
      brandName: brandName ?? this.brandName,
      nickName: nickName ?? this.nickName,
      emails: emails ?? this.emails,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      institution: institution ?? this.institution,
      isEdit: isEdit,
      id: id,
    );
  }

  Institution toInstitution([String id = '', String userId = '']) =>
      Institution(
        id: id,
        userId: userId,
        officialName: officialName.value,
        commercialName: commercialName.value,
        brandName: brandName.value,
        nickname: nickName.value,
        emails: emails.map((email) => email.value).toList(),
        phoneNumbers:
            phoneNumbers.map((phoneNumbers) => phoneNumbers.value).toList(),
      );
}
