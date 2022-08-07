part of 'address_suggestions_bloc.dart';

@freezed
class AddressSuggestionsState with _$AddressSuggestionsState {
  const factory AddressSuggestionsState(
      {@Default('')
          String governateSearch,
      @Default([])
          List<RefGovernate> governatesSuggestions,
      @Default(AutoSuggestionState.emptyText)
          AutoSuggestionState governatesSuggestionState,
      @Default('')
          String citySearch,
      @Default([])
          List<RefCity> citiesSuggestions,
      @Default(AutoSuggestionState.emptyText)
          AutoSuggestionState citiesSuggestionState,
      @Default('')
          String neighborhoodSearch,
      @Default([])
          List<RefNeighborhood> neighborhoodsSuggestions,
      @Default(AutoSuggestionState.emptyText)
          AutoSuggestionState neighborhoodsSuggestionState,
      @Default(None<RefGovernate>())
          Option<RefGovernate> governateOrNull,
      @Default(None<RefCity>())
          Option<RefCity> cityOrNull,
      @Default(None<RefNeighborhood>())
          Option<RefNeighborhood> neighborhoodOrNull,
      @Default(None<GeoPoint>())
          Option<GeoPoint> geoPointOrNull,
      @Default(AddressSuggestionsStatus.initial)
          AddressSuggestionsStatus status}) = _AddressSuggestionsState;
}

enum AddressSuggestionsStatus {
  initial,
  governateSelected,
  citySelected,
  neighborhoodSelected,

  governateUnSelected,
  cityUnSelected,
  neighborhoodUnSelected,

  loading,
  addingGovernateSucess,
  addingCitySuccess,
  addingNeighborhoodSuccess,
}
