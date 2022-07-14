part of 'base_address_cubit.dart';

@immutable
abstract class AddAddressState extends Equatable {
  const AddAddressState();
}

class AddAddressInitialState extends AddAddressState {
  const AddAddressInitialState();

  @override
  List<Object?> get props => [];
}

class AddAddressAddedState extends AddAddressState {
  final Address address;
  const AddAddressAddedState({required this.address});

  @override
  List<Object?> get props => [address];
}

class AddAddressDeletedState extends AddAddressState {
  final String id;
  const AddAddressDeletedState({required this.id});

  @override
  List<Object?> get props => [id];
}

class AddAddressUpdatedState extends AddAddressState {
  final Address address;
  const AddAddressUpdatedState({required this.address});

  @override
  List<Object?> get props => [address];
}

class AddAddressLoadedState extends AddAddressState {
  final Country country;
  final RequiredObject<Governate> governate;
  final RequiredObject<City> city;
  final RequiredString district;
  final RequiredString description;
  final RequiredObject<GeoPoint> geoPoint;
  final bool geoPointLoading;
  final FormzStatus status;
  final String? errorMessage;
  final bool isEdit;
  final bool initEdit;
  const AddAddressLoadedState({
    required this.country,
    this.governate = const RequiredObject.pure(),
    this.city = const RequiredObject.pure(),
    this.district = const RequiredString.pure(),
    this.description = const RequiredString.pure(),
    this.geoPoint = const RequiredObject.pure(),
    this.geoPointLoading = false,
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.isEdit = false,
    this.initEdit = false,
  });

  AddAddressState copyWith({
    Country? country,
    RequiredObject<Governate>? governate,
    RequiredObject<City>? city,
    RequiredString? district,
    RequiredString? description,
    RequiredObject<GeoPoint>? geoPoint,
    bool? geoPointLoading,
    bool? initEdit,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return AddAddressLoadedState(
        country: country ?? this.country,
        governate: governate ?? this.governate,
        city: city ?? this.city,
        district: district ?? this.district,
        description: description ?? this.description,
        geoPoint: geoPoint ?? this.geoPoint,
        geoPointLoading: geoPointLoading ?? this.geoPointLoading,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        isEdit: isEdit,
        initEdit: initEdit ?? this.initEdit);
  }

  Address toAddress({
    String id = '',
  }) =>
      Address(
        id: id,
        country: country.enName,
        governate: governate.value!.enName,
        city: city.value!.enName,
        district: district.value,
        description: description.value,
        geoPoint: geoPoint.value!,
      );
  @override
  List<Object?> get props => [
        country,
        governate,
        city,
        district,
        description,
        geoPoint,
        geoPointLoading,
        status,
        errorMessage,
        isEdit,
        initEdit,
      ];
}
