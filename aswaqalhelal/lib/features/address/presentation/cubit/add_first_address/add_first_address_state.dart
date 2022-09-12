part of 'add_first_address_cubit.dart';

class AddFirstAddressState extends Equatable {
  final Name name;
  final RequiredObject<RefAddressDetails> refAddressDetails;
  final RequiredObject<GeoPoint> geoPoint;
  final MinimumLengthString description;
  final FormzStatus status;
  final String? errorMessage;

  const AddFirstAddressState({
    this.name = const Name.pure(),
    this.refAddressDetails = const RequiredObject.pure(),
    this.geoPoint = const RequiredObject.pure(),
    this.description = const MinimumLengthString.pure(10),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  AddFirstAddressState copyWith({
    Name? name,
    RequiredObject<RefAddressDetails>? refAddressDetails,
    RequiredObject<GeoPoint>? geoPoint,
    MinimumLengthString? description,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return AddFirstAddressState(
      name: name ?? this.name,
      refAddressDetails: refAddressDetails ?? this.refAddressDetails,
      geoPoint: geoPoint ?? this.geoPoint,
      description: description ?? this.description,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [name, refAddressDetails, geoPoint, description, status, errorMessage];
}
