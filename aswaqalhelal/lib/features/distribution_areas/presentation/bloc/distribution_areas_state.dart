part of 'distribution_areas_bloc.dart';

@freezed
abstract class DistributionAreasState with _$DistributionAreasState {
  const factory DistributionAreasState(
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
      @Default([])
          List<DistributionArea> distribtionAreas,
      @Default(AddressSuggestionsStatus.initial)
          AddressSuggestionsStatus addressStatus,
      @Default(DistributionAreasStatus.distributionAreasloading)
          DistributionAreasStatus status,
      String? errorMessage}) = _DistributionAreasState;
}

enum DistributionAreasStatus {
  distributionAreasloading,
  distributionArealoaded,
  error,
  loading,
  success,
  failure
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
