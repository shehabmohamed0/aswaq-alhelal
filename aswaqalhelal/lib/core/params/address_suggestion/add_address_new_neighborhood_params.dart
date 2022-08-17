import 'package:aswaqalhelal/features/address_suggestions/domain/entities/entities.dart';
import 'package:aswaqalhelal/features/address_suggestions/domain/entities/ref_governate.dart';

import 'add_address_new_governate_params.dart';

class AddNewNeighborhoodParams implements AddRefAddressParams {
  final String country;
  final RefGovernate refGovernate;
  final RefCity refCity;
  final String neighborhood;

  AddNewNeighborhoodParams({
    required this.country,
    required this.refGovernate,
    required this.refCity,
    required this.neighborhood,
  });
}
