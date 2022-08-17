
import '../../../address_suggestions/domain/entities/ref_city.dart';
import '../../../address_suggestions/domain/entities/ref_district.dart';
import '../../../address_suggestions/domain/entities/ref_governate.dart';
import '../../domain/entities/geo_point.dart';

class AddressDetails {
  final RefGovernate refGovernate;
  final RefCity refCity;
  final RefNeighborhood refNeighborhood;
  final GeoPoint geoPoint;
  AddressDetails({
    required this.refGovernate,
    required this.refCity,
    required this.refNeighborhood,
    required this.geoPoint,
  });
}
