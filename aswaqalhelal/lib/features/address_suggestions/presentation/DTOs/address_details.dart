import 'package:geo_logic/features/domain/entities/entities.dart';

import '../../domain/entities/ref_city.dart';
import '../../domain/entities/ref_district.dart';
import '../../domain/entities/ref_governate.dart';

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
