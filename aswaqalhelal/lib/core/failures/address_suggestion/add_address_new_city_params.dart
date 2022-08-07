import 'package:aswaqalhelal/features/address_suggestions/domain/entities/ref_governate.dart';

class AddNewCityParams {
  final String country;
  final RefGovernate refGovernate;
  final String city;

  AddNewCityParams({
    required this.country,
    required this.refGovernate,
    required this.city,
  });
}
