class GetRefAddressParams{}
class GetGovernatesSuggestionsParams implements GetRefAddressParams{
  final String country;
  final String searchText;
  GetGovernatesSuggestionsParams({
    required this.country,
    required this.searchText,
  });
}
