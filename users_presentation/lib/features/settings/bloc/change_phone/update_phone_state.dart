part of 'update_phone_cubit.dart';

class UpdatePhoneState extends Equatable {
  const UpdatePhoneState({
    this.phoneNumber = const PhoneNumber.pure(),
    this.status = FormzStatus.pure,
    this.verificationId = '',
    this.errorMessage,
  });

  final PhoneNumber phoneNumber;
  final FormzStatus status;

  final String verificationId;

  final String? errorMessage;
  UpdatePhoneState copyWith({
    PhoneNumber? phoneNumber,
    FormzStatus? status,
    String? verificationId,
    String? errorMessage,
  }) {
    return UpdatePhoneState(
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
