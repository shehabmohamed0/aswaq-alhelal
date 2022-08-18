part of 'add_edit_address_cubit.dart';

class AddEditAddressState extends Equatable {
  final RequiredObject<RefAddressDetails> refAddressDetails;
  final MinimumLengthString description;
  final RequiredObject<GeoPoint> geoPoint;
  final RequiredObject<FullAddressDetails> oldAddressDetails;
  final AddEditAddressStatus status;
  final String? errorMessage;
  final Address? address;
  const AddEditAddressState({
    this.refAddressDetails = const RequiredObject.pure(),
    this.description = const MinimumLengthString.pure(10),
    this.geoPoint = const RequiredObject.pure(),
    this.oldAddressDetails = const RequiredObject.pure(),
    this.status = AddEditAddressStatus.initial,
    this.errorMessage,
    this.address,
  });

  @override
  List<Object?> get props => [
        refAddressDetails,
        description,
        geoPoint,
        oldAddressDetails,
        status,
        errorMessage,
        address
      ];

  AddEditAddressState copyWith({
    RequiredObject<RefAddressDetails>? refAddressDetails,
    MinimumLengthString? description,
    RequiredObject<GeoPoint>? geoPoint,
    RequiredObject<FullAddressDetails>? oldAddressDetails,
    AddEditAddressStatus? status,
    String? errorMessage,
    Address? address,
  }) {
    return AddEditAddressState(
        refAddressDetails: refAddressDetails ?? this.refAddressDetails,
        description: description ?? this.description,
        geoPoint: geoPoint ?? this.geoPoint,
        oldAddressDetails: oldAddressDetails ?? this.oldAddressDetails,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        address: address ?? this.address);
  }
}

enum AddEditAddressStatus {
  initial,
  loading,
  success,
  failure,
}
