part of 'address_suggestions_bloc.dart';

@freezed
class AddressSuggestionsEvent with _$AddressSuggestionsEvent {
  const factory AddressSuggestionsEvent.searchGovernate(String searchText) =
      SearchGovernate;
  const factory AddressSuggestionsEvent.searchCity(String searchText) =
      SearchCity;
  const factory AddressSuggestionsEvent.searchNeighborhood(String searchText) =
      SearchNeighborhood;

  const factory AddressSuggestionsEvent.selectGovernate(
      RefGovernate governate) = SelectGovernate;
  const factory AddressSuggestionsEvent.selectCity(RefCity city) = SelectCity;
  const factory AddressSuggestionsEvent.selectNeighborhood(
      RefNeighborhood neighborhood) = SelectNeighborhood;
  const factory AddressSuggestionsEvent.unSelectGovernate() = UnSelectGovernate;
  const factory AddressSuggestionsEvent.unSelectCity() =
      UnSelectCity;
  const factory AddressSuggestionsEvent.unSelectNeighborhood(
     ) = UnSelectNeighborhood;

  const factory AddressSuggestionsEvent.addNewGovernate(String governate) =
      AddNewGovernateEvent;
  const factory AddressSuggestionsEvent.addNewCity(String city) =
      AddNewCityEvent;
  const factory AddressSuggestionsEvent.addNewNeighborhood(
      String neighborhood) = AddNewNeighborhoodEvent;
}
