import 'package:equatable/equatable.dart';

import '../../../address/domain/entities/address.dart';
import '../../domain/entities/entities.dart';

class RefAddressDetails extends Equatable {
  final RefGovernate refGovernate;
  final RefCity refCity;
  final RefNeighborhood refNeighborhood;

  const RefAddressDetails({
    required this.refGovernate,
    required this.refCity,
    required this.refNeighborhood,
  });

  factory RefAddressDetails.fromAddress(Address address) => RefAddressDetails(
        refGovernate: RefGovernate(
            id: address.governateId,
            country: address.country,
            name: address.governate),
        refCity: RefCity(
            country: address.country,
            governate: address.governate,
            id: address.cityId,
            name: address.city),
        refNeighborhood: RefNeighborhood(
          country: address.country,
          governate: address.governate,
          city: address.city,
          id: address.neighborhoodId,
          name: address.neighborhood,
        ),
      );

  @override
  List<Object?> get props => [refGovernate, refCity, refNeighborhood];
}
