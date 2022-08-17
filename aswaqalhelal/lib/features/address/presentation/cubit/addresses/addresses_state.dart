part of 'addresses_cubit.dart';

abstract class AddressesState extends Equatable {
  const AddressesState();

  @override
  List<Object> get props => [];
}

class AddressesInitial extends AddressesState {}

class AddressesLoading extends AddressesState {}

class AddressesError extends AddressesState {}

class AddressesLoaded extends AddressesState {
  final List<Address> addresses;
  const AddressesLoaded({
    required this.addresses,
  });
  @override
  List<Object> get props => [addresses];
}

class AddressesEmpty extends AddressesState {
  const AddressesEmpty();
  @override
  List<Object> get props => [];
}
