import 'get_governates_suggestions_params.dart';

class GetNeighborhoodsSuggestionsParams  implements GetRefAddressParams{
  final String country;
  final String governate;
  final String city;
  final String searchText;
  GetNeighborhoodsSuggestionsParams({
    required this.country,
    required this.governate,
    required this.city,
    required this.searchText,
  });
}
