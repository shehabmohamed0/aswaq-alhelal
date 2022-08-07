import '../../../features/data/models/address_model.dart';
import '../../../features/data/models/geo_point_model.dart';
import '../../../features/domain/entities/geo_point.dart';

class UpdateAddressParams {
  final String id;
  final String country;
  final String governate;
  final String city;
  final String neighborhood;
  final String description;
  final GeoPoint geoPoint;

  UpdateAddressParams({
    required this.id,
    required this.country,
    required this.governate,
    required this.city,
    required this.neighborhood,
    required this.description,
    required this.geoPoint,
  });

  AddressModel get toAddressModel => AddressModel(
      id: id,
      country: country,
      governate: governate,
      city: city,
      neighborhood: neighborhood,
      description: description,
      geoPointModel: GeoPointModel(lat: geoPoint.lat, long: geoPoint.long));
}
