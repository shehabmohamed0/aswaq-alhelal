part of 'phone_sign_in_form_cubit.dart';

class PhoneSignInFormState extends Equatable {
  const PhoneSignInFormState({
    this.phoneNumber = const PhoneNumber.pure(),
    this.status = FormzStatus.pure,
    this.verificationId,
    this.errorMessage,
    this.codeSent = false,
    this.otp = const OTP.pure(),
    this.verificationCompleted = false,
  });
  final PhoneNumber phoneNumber;
  final bool codeSent;
  final bool verificationCompleted;
  final OTP otp;
  final FormzStatus status;
  final String? verificationId;
  final String? errorMessage;

  PhoneSignInFormState copyWith({
    PhoneNumber? phoneNumber,
    FormzStatus? status,
    String? verificationId,
    String? errorMessage,
    bool? codeSent,
    bool? verificationCompleted,
    OTP? otp,
  }) {
    return PhoneSignInFormState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      otp: otp ?? this.otp,
      verificationId: verificationId ?? this.verificationId,
      errorMessage: errorMessage ?? this.errorMessage,
      codeSent: codeSent ?? this.codeSent,
      verificationCompleted: verificationCompleted ?? this.verificationCompleted,
    );
  }

  @override
  List<Object?> get props => [
        phoneNumber,
        otp,
        status,
        verificationId,
        errorMessage,
        codeSent,
        verificationCompleted
      
      ];
}
