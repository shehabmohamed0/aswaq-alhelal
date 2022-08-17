import 'package:aswaqalhelal/features/address_suggestions/domain/entities/ref_governate.dart';

import 'add_address_new_governate_params.dart';

class AddNewCityParams implements AddRefAddressParams{
  final String country;
  final RefGovernate refGovernate;
  final String city;

  AddNewCityParams({
    required this.country,
    required this.refGovernate,
    required this.city,
  });
}
