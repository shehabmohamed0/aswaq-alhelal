import 'package:aswaqalhelal/features/address/domain/entities/address.dart';
import 'package:equatable/equatable.dart';

import '../../../address_suggestions/presentation/DTOs/ref_address_details.dart';
import '../../domain/entities/geo_point.dart';

class FullAddressDetails extends Equatable {
  final RefAddressDetails refAddressDetails;
  final GeoPoint geoPoint;
  final String description;
  const FullAddressDetails({
    required this.refAddressDetails,
    required this.geoPoint,
    required this.description,
  });

  @override
  List<Object?> get props => [refAddressDetails, geoPoint, description];

  factory FullAddressDetails.fromAddress(Address address) => FullAddressDetails(
        refAddressDetails: RefAddressDetails.fromAddress(address),
        geoPoint: address.geoPoint,
        description: address.description,
      );
}
