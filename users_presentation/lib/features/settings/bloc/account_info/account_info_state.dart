part of 'account_info_cubit.dart';

class AccountInfoState extends Equatable {
  const AccountInfoState(
      {this.name = const Name.pure(),
      this.birthDate,
      this.gender = '',
      this.status = FormzStatus.pure,
      this.errorMessage});
  final Name name;
  final DateTime? birthDate;
  final String gender;
  final FormzStatus status;
  final String? errorMessage;
  AccountInfoState copyWith(
      {Name? name,
      DateTime? birthDate,
      String? gender,
      FormzStatus? status,
      String? errorMessage}) {
    return AccountInfoState(
        name: name ?? this.name,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [name, birthDate, gender, status];
}
