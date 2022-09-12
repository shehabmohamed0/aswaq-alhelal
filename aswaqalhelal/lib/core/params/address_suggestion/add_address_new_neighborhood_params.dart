import '../../../features/address_suggestions/domain/entities/entities.dart';
import 'add_address_new_governate_params.dart';

class AddNewNeighborhoodParams implements AddRefAddressParams {
  final String country;
  final RefGovernate refGovernate;
  final RefCity refCity;
  final String neighborhood;
  final String searchText;

  AddNewNeighborhoodParams({
    required this.country,
    required this.refGovernate,
    required this.refCity,
    required this.neighborhood,
    required this.searchText,
  });
}
