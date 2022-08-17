
import 'package:aswaqalhelal/features/address/data/models/address_model.dart';
import 'package:aswaqalhelal/features/address/data/models/geo_point_model.dart';
import 'package:aswaqalhelal/features/address/domain/entities/entities.dart';

class UpdateAddressParams {
  final String id;
  final String country;
  final String governateId;
  final String governate;
  final String cityId;
  final String city;
  final String neighborhoodId;
  final String neighborhood;
  final String description;
  final GeoPoint geoPoint;

  UpdateAddressParams({
    required this.id,
    required this.country,
    required this.governateId,
    required this.governate,
    required this.cityId,
    required this.city,
    required this.neighborhoodId,
    required this.neighborhood,
    required this.description,
    required this.geoPoint,
  });

  AddressModel get toModel => AddressModel(
        id: id,
        country: country,
        governateId: governateId,
        governate: governate,
        cityId: cityId,
        city: city,
        neighborhoodId: neighborhoodId,
        neighborhood: neighborhood,
        description: description,
        geoPointModel: GeoPointModel(lat: geoPoint.lat, long: geoPoint.long),
      );
}
