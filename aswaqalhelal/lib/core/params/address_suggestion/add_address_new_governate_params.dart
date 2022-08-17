abstract class AddRefAddressParams{}
class AddNewGovernateParams implements AddRefAddressParams{
  final String country;
  final String governate;

  AddNewGovernateParams({
    required this.country,
    required this.governate,
  });
}
