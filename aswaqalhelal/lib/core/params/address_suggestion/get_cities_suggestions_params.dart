import 'get_governates_suggestions_params.dart';

class GetCitiesSuggestionsParams  implements GetRefAddressParams{
  final String country;
  final String governate;
  final String searchText;
  GetCitiesSuggestionsParams({
    required this.country,
    required this.governate,
    required this.searchText,
  });
}
