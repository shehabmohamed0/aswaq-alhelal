abstract class AddRefAddressParams {}

class AddNewGovernateParams implements AddRefAddressParams {
  final String country;
  final String governate;
  final String searchText;

  AddNewGovernateParams({
    required this.country,
    required this.governate,
    required this.searchText,
  });
}
