part of 'sign_up_form_cubit.dart';

class SignUpFormState extends Equatable {
  const SignUpFormState({
    this.name = const Name.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.verificationId,
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.initialized = false,
  });

  final Name name;
  final PhoneNumber phoneNumber;
  final FormzStatus status;
  final String? verificationId;
  final String? errorMessage;
  final bool initialized;

  @override
  List<Object?> get props =>
      [name, phoneNumber, status, errorMessage, initialized];

  SignUpFormState copyWith({
    Name? name,
    PhoneNumber? phoneNumber,
    FormzStatus? status,
    String? errorMessage,
    String? verificationId,
    bool? initialized,
  }) {
    return SignUpFormState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      status: status ?? this.status,
      verificationId: verificationId ?? this.verificationId,
      errorMessage: errorMessage ?? this.errorMessage,
      initialized: initialized ?? this.initialized,
    );
  }
}
