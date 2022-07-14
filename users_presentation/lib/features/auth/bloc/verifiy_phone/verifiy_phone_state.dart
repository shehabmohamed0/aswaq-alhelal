part of 'verifiy_phone_cubit.dart';

class VerifiyPhoneState extends Equatable {
  const VerifiyPhoneState(
      {this.otp = const OTP.pure(),
      this.status = FormzStatus.pure,
      this.autoRecievedCode = false,
      this.autoVerified = false,
      this.errorMessage});
  final OTP otp;
  final FormzStatus status;
  final bool autoRecievedCode;
  final bool autoVerified;
  final String? errorMessage;
  VerifiyPhoneState copyWith({
    OTP? otp,
    FormzStatus? status,
    bool? autoRecievedCode,
    bool? autoVerified,
    String? errorMessage,
  }) {
    return VerifiyPhoneState(
      otp: otp ?? this.otp,
      status: status ?? this.status,
      autoRecievedCode: autoRecievedCode ?? this.autoRecievedCode,
      autoVerified: autoVerified ?? this.autoVerified,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [otp, status, autoRecievedCode, autoVerified, errorMessage];
}
