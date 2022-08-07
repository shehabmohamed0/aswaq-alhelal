import '../../../features/domain/entities/geo_point.dart';

class AddAddressParams {
  final String country;
  final String governate;
  final String city;
  final String neighborhood;
  final String description;
  final GeoPoint geoPoint;
  final String Function(String) collectionPath;
  AddAddressParams({
    required this.country,
    required this.governate,
    required this.city,
    required this.neighborhood,
    required this.description,
    required this.geoPoint,
    required this.collectionPath
  });

}
