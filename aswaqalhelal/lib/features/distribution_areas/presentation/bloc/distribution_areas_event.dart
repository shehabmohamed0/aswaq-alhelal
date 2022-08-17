part of 'distribution_areas_bloc.dart';

@freezed
abstract class DistributionAreasEvent with _$DistributionAreasEvent {
  const factory DistributionAreasEvent.loadDistributionAreas(
      String institutionId) = LoadDistributionAreas;
  const factory DistributionAreasEvent.addDistributionAreas(
      String institutionId) = AddDistributionAreas;
  const factory DistributionAreasEvent.updateDistributionAreas(
      String institutionId) = UpdateDistributionAreas;
  const factory DistributionAreasEvent.deleteDistributionAreas(
          String institutionId, DistributionArea distributionArea) =
      DeleteDistributionAreas;

  const factory DistributionAreasEvent.searchGovernate(String searchText) =
      SearchGovernate;
  const factory DistributionAreasEvent.searchCity(String searchText) =
      SearchCity;
  const factory DistributionAreasEvent.searchNeighborhood(String searchText) =
      SearchNeighborhood;

  const factory DistributionAreasEvent.selectGovernate(RefGovernate governate) =
      SelectGovernate;
  const factory DistributionAreasEvent.selectCity(RefCity city) = SelectCity;
  const factory DistributionAreasEvent.selectNeighborhood(
      RefNeighborhood neighborhood) = SelectNeighborhood;
  const factory DistributionAreasEvent.unSelectGovernate() = UnSelectGovernate;
  const factory DistributionAreasEvent.unSelectCity() = UnSelectCity;
  const factory DistributionAreasEvent.unSelectNeighborhood() =
      UnSelectNeighborhood;

  const factory DistributionAreasEvent.addNewGovernate(String governate) =
      AddNewGovernateEvent;
  const factory DistributionAreasEvent.addNewCity(String city) =
      AddNewCityEvent;
  const factory DistributionAreasEvent.addNewNeighborhood(String neighborhood) =
      AddNewNeighborhoodEvent;
}
