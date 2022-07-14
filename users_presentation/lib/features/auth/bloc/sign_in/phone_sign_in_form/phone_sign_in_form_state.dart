part of 'phone_sign_in_form_cubit.dart';

class PhoneSignInFormState extends Equatable {
  const PhoneSignInFormState(
      {this.phoneNumber = const PhoneNumber.pure(),
      this.status = FormzStatus.pure,
      this.verificationId,
      this.errorMessage});
  final PhoneNumber phoneNumber;
  final FormzStatus status;
  final String? verificationId;
  final String? errorMessage;
  PhoneSignInFormState copyWith({
    PhoneNumber? phoneNumber,
    FormzStatus? status,
    String? verificationId,
    String? errorMessage,
  }) {
    return PhoneSignInFormState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      verificationId: verificationId ?? this.verificationId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [phoneNumber, status, verificationId, errorMessage];
}
