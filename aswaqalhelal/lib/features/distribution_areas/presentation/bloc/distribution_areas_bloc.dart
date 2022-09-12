import 'dart:async';
import 'dart:collection';

import 'package:aswaqalhelal/core/services/prepare_for_search.dart';
import 'package:bloc/bloc.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/packages/stream_transform.dart';

import '../../../../core/params/address_suggestion/params.dart';
import '../../../address_suggestions/domain/entities/entities.dart';
import '../../../address_suggestions/domain/usecases/usecases.dart';
import '../../../instutution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../domain/entities/distribution_area.dart';
import '../../domain/repositories/distribution_area_repository.dart';
import '../../domain/usecases/usecases.dart';

part 'distribution_areas_bloc.freezed.dart';
part 'distribution_areas_event.dart';
part 'distribution_areas_state.dart';

EventTransformer<E> debounce<E>() {
  return (events, mapper) {
    return events.debounce(const Duration(milliseconds: 300)).switchMap(mapper);
  };
}

@injectable
class DistributionAreasBloc
    extends Bloc<DistributionAreasEvent, DistributionAreasState> {
  final GetDistributionAreas _getDistributionAreas;
  final AddDistributionArea _addDistributionArea;
  final UpdateDistributionArea _updateDistributionAreas;
  final DeleteDistributionArea _deleteDistributionAreas;
  final GetGovernatesSuggestions _getGovernatesSuggestions;
  final GetCitiesSuggestions _getCitiesSuggestions;
  final GetNeighborhoodsSuggestions _getNeighborhoodsSuggestions;
  final AddNewGovernate _addNewGovernate;
  final AddNewCity _addNewCity;
  final AddNewNeighborhood _addNewNeighborhood;

  DistributionAreasBloc(
    this._getGovernatesSuggestions,
    this._getCitiesSuggestions,
    this._getNeighborhoodsSuggestions,
    this._addNewGovernate,
    this._addNewCity,
    this._addNewNeighborhood,
    this._getDistributionAreas,
    this._addDistributionArea,
    this._updateDistributionAreas,
    this._deleteDistributionAreas,
  ) : super(const DistributionAreasState()) {
    on<DistributionAreasEvent>(_onNormalDistributionAreasEvent);
    on<SearchGovernate>(_onSearchGovernate, transformer: debounce());
    on<SearchCity>(_onSearchCity, transformer: debounce());
    on<SearchNeighborhood>(_onSearchNeighborhood, transformer: debounce());
  }

  FutureOr<void> _onNormalDistributionAreasEvent(DistributionAreasEvent event,
      Emitter<DistributionAreasState> emit) async {
    await event.mapOrNull(
      loadDistributionAreas: (event) async {
        final either = await _getDistributionAreas(
            params:
                GetDistributionAreasParams(institutionId: event.institutionId));
        either.fold(
          (failure) =>
              emit(state.copyWith(status: DistributionAreasStatus.error)),
          (distributionAreas) => emit(state.copyWith(
            distribtionAreas: distributionAreas,
            status: DistributionAreasStatus.distributionArealoaded,
          )),
        );
      },
      addDistributionAreas: (event) async {
        if (state.status == DistributionAreasStatus.loading) return;
        if (state.governateOrNull.isNone()) return;

        emit(state.copyWith(status: DistributionAreasStatus.loading));
        int index = state.distribtionAreas.indexWhere(
          (element) {
            return element.governate ==
                    state.governateOrNull.toNullable()?.name &&
                element.city == state.cityOrNull.toNullable()?.name &&
                element.neighborhood ==
                    state.neighborhoodOrNull.toNullable()?.name;
          },
        );
        if (index != -1) {
          emit(state.copyWith(
              status: DistributionAreasStatus.failure,
              errorMessage: 'Area exists before.'));
          return;
        }

        emit(
          state.copyWith(status: DistributionAreasStatus.loading),
        );
        final either = await _addDistributionArea(
          params: AddDistributionAreaParams(
              institutionId: event.institutionId,
              refGovernate: state.governateOrNull.toNullable()!,
              refCity: state.cityOrNull.toNullable(),
              refNeighborhood: state.neighborhoodOrNull.toNullable()),
        );
        either.fold((failure) {
          failure as ServerFailure;
          emit(state.copyWith(
            status: DistributionAreasStatus.failure,
            errorMessage: failure.message,
          ));
        }, (distributionArea) {
          emit(
            state.copyWith(
                distribtionAreas: List.of(state.distribtionAreas)
                  ..add(distributionArea),
                status: DistributionAreasStatus.success),
          );
        });
      },
      updateDistributionAreas: (event) {},
      deleteDistributionAreas: (event) async {
        if (state.status == DistributionAreasStatus.loading) return;
        emit(state.copyWith(status: DistributionAreasStatus.loading));
        final either = await _deleteDistributionAreas(
          params: DeleteDistributionAreaParams(
            institutionId: event.institutionId,
            distributionArea: event.distributionArea,
          ),
        );
        either.fold((failure) {
          failure as ServerFailure;

          emit(state.copyWith(
            status: DistributionAreasStatus.failure,
            errorMessage: failure.message,
          ));
        }, (distributionAreaId) {
          emit(
            state.copyWith(
              distribtionAreas: List.of(state.distribtionAreas)
                ..removeWhere((element) => element.id == distributionAreaId),
              status: DistributionAreasStatus.success,
            ),
          );
        });
      },
      selectGovernate: (event) async {
        emit(state.copyWith(
          governateOrNull: some(event.governate),
          addressStatus: AddressSuggestionsStatus.governateSelected,
        ));
      },
      selectCity: (event) async {
        emit(state.copyWith(
          cityOrNull: some(event.city),
          addressStatus: AddressSuggestionsStatus.citySelected,
        ));
      },
      selectNeighborhood: (event) async {
        emit(state.copyWith(
          neighborhoodOrNull: some(event.neighborhood),
          addressStatus: AddressSuggestionsStatus.neighborhoodSelected,
        ));
      },
      addNewGovernate: (event) async {
        await _onAddNewGovernate(event, emit);
      },
      addNewCity: (event) async {
        await _onAddNewCity(event, emit);
      },
      addNewNeighborhood: (event) async {
        await _onAddNewNeighborhood(event, emit);
      },
      unSelectGovernate: (event) async {
        emit(state.copyWith(
          governateOrNull: none(),
          cityOrNull: none(),
          neighborhoodOrNull: none(),
          governatesSuggestionState: AutoSuggestionState.emptyText,
          citiesSuggestionState: AutoSuggestionState.emptyText,
          neighborhoodsSuggestionState: AutoSuggestionState.emptyText,
          addressStatus: AddressSuggestionsStatus.governateUnSelected,
        ));
      },
      unSelectCity: (event) async {
        emit(state.copyWith(
          cityOrNull: none(),
          neighborhoodOrNull: none(),
          citiesSuggestionState: AutoSuggestionState.emptyText,
          neighborhoodsSuggestionState: AutoSuggestionState.emptyText,
          addressStatus: AddressSuggestionsStatus.cityUnSelected,
        ));
      },
      unSelectNeighborhood: (event) async {
        emit(state.copyWith(
          neighborhoodOrNull: none(),
          neighborhoodsSuggestionState: AutoSuggestionState.emptyText,
          addressStatus: AddressSuggestionsStatus.neighborhoodUnSelected,
        ));
      },
    );
  }

  Future<void> _onAddNewGovernate(
      AddNewGovernateEvent event, Emitter<DistributionAreasState> emit) async {
    emit(state.copyWith(addressStatus: AddressSuggestionsStatus.loading));

    final either = await _addNewGovernate(
      params: AddNewGovernateParams(
          country: 'egypt',
          governate: event.governate.trim(),
          searchText: event.governate.prepareForSearch()),
    );
    either.fold(
      (failure) {},
      (refGovernate) => emit(state.copyWith(
        governateOrNull: some(refGovernate),
        addressStatus: AddressSuggestionsStatus.addingGovernateSucess,
      )),
    );
  }

  Future<void> _onAddNewCity(
      AddNewCityEvent event, Emitter<DistributionAreasState> emit) async {
    emit(state.copyWith(addressStatus: AddressSuggestionsStatus.loading));
    final either = await _addNewCity(
      params: AddNewCityParams(
          country: 'egypt',
          refGovernate: state.governateOrNull.toNullable()!,
          city: event.city.trim(),
          searchText: event.city.prepareForSearch()),
    );
    either.fold(
      (failure) {},
      (refCity) => emit(state.copyWith(
        cityOrNull: some(refCity),
        addressStatus: AddressSuggestionsStatus.addingCitySuccess,
      )),
    );
  }

  Future<void> _onAddNewNeighborhood(AddNewNeighborhoodEvent event,
      Emitter<DistributionAreasState> emit) async {
    emit(state.copyWith(addressStatus: AddressSuggestionsStatus.loading));

    final either = await _addNewNeighborhood(
      params: AddNewNeighborhoodParams(
          country: 'egypt',
          refGovernate: state.governateOrNull.toNullable()!,
          refCity: state.cityOrNull.toNullable()!,
          neighborhood: event.neighborhood,
          searchText: event.neighborhood.prepareForSearch()),
    );
    either.fold(
      (failure) {},
      (refNeighborhood) => emit(state.copyWith(
        neighborhoodOrNull: some(refNeighborhood),
        addressStatus: AddressSuggestionsStatus.addingNeighborhoodSuccess,
      )),
    );
  }

  FutureOr<void> _onSearchGovernate(
      SearchGovernate event, Emitter<DistributionAreasState> emit) async {
    if (event.searchText.trim().length > 2) {
      emit(state.copyWith(
        governatesSuggestionState: AutoSuggestionState.loading,
      ));
      final failureOrGovernates = await _getGovernatesSuggestions(
          params: GetGovernatesSuggestionsParams(
        country: 'egypt',
        searchText: event.searchText.prepareForSearch(),
      ));

      failureOrGovernates.fold(
        (failure) => emit(state.copyWith(
          governatesSuggestionState: AutoSuggestionState.error,
        )),
        (governates) {
          if (governates.isEmpty) {
            emit(state.copyWith(
              governatesSuggestions: governates,
              governatesSuggestionState: AutoSuggestionState.loaded,
            ));
          } else {
            HashSet<String> governatesHashSet = HashSet();

            final newGovernates = governates.where(
              (governate) {
                governatesHashSet.add(governate.name);
                final index = state.distribtionAreas.indexWhere((element) {
                  return element.governate == governate.name &&
                      element.city == null &&
                      element.neighborhood == null;
                });

                return index == -1;
              },
            ).toList();

            emit(
              state.copyWith(
                governatesSuggestions: governates,
                governatesSuggestionState: newGovernates.isEmpty &&
                        governatesHashSet.contains(event.searchText)
                    ? AutoSuggestionState.emptyShowNoSuggestions
                    : AutoSuggestionState.loaded,
              ),
            );
          }
        },
      );
    } else {
      emit(state.copyWith(
          governatesSuggestionState: AutoSuggestionState.emptyText));
    }
  }

  FutureOr<void> _onSearchCity(
      SearchCity event, Emitter<DistributionAreasState> emit) async {
    if (event.searchText.trim().length > 2) {
      emit(state.copyWith(
        citiesSuggestionState: AutoSuggestionState.loading,
      ));
      final failureOrGovernates = await _getCitiesSuggestions(
          params: GetCitiesSuggestionsParams(
        country: 'egypt',
        governate: state.governateOrNull.toNullable()!.name,
        searchText: event.searchText.prepareForSearch(),
      ));

      failureOrGovernates.fold(
        (failure) => emit(state.copyWith(
          citiesSuggestionState: AutoSuggestionState.error,
        )),
        (cities) {
          if (cities.isEmpty) {
            emit(state.copyWith(
              citiesSuggestions: cities,
              citiesSuggestionState: AutoSuggestionState.loaded,
            ));
          } else {
            HashSet<String> citiesHashSet = HashSet();

            final newCities = cities.where(
              (city) {
                citiesHashSet.add(city.name);
                final index = state.distribtionAreas.indexWhere((element) {
                  return element.governate == city.governate &&
                      element.city == city.name &&
                      element.neighborhood == null;
                });

                return index == -1;
              },
            ).toList();
            emit(state.copyWith(
              citiesSuggestions: newCities,
              citiesSuggestionState:
                  newCities.isEmpty && citiesHashSet.contains(event.searchText)
                      ? AutoSuggestionState.emptyShowNoSuggestions
                      : AutoSuggestionState.loaded,
            ));
          }
        },
      );
    } else {
      emit(
          state.copyWith(citiesSuggestionState: AutoSuggestionState.emptyText));
    }
  }

  FutureOr<void> _onSearchNeighborhood(
      SearchNeighborhood event, Emitter<DistributionAreasState> emit) async {
    if (event.searchText.trim().length > 2) {
      emit(state.copyWith(
        neighborhoodsSuggestionState: AutoSuggestionState.loading,
      ));
      final failureOrGovernates = await _getNeighborhoodsSuggestions(
          params: GetNeighborhoodsSuggestionsParams(
              country: 'egypt',
              governate: state.governateOrNull.toNullable()!.name,
              city: state.cityOrNull.toNullable()!.name,
              searchText: event.searchText.prepareForSearch()));

      failureOrGovernates.fold(
        (failure) => emit(state.copyWith(
          neighborhoodsSuggestionState: AutoSuggestionState.error,
        )),
        (neighborhoods) {
          if (neighborhoods.isEmpty) {
            emit(
              state.copyWith(
                neighborhoodsSuggestions: neighborhoods,
                neighborhoodsSuggestionState: AutoSuggestionState.loaded,
              ),
            );
          } else {
            HashSet<String> neighborhoodsHashSet = HashSet();

            final newNeighborhoods = neighborhoods.where(
              (neighborhood) {
                neighborhoodsHashSet.add(neighborhood.name);
                final index = state.distribtionAreas.indexWhere(
                  (element) {
                    return element.governate == neighborhood.governate &&
                        element.city == neighborhood.city &&
                        element.neighborhood == neighborhood.name;
                  },
                );

                return index == -1;
              },
            ).toList();
            emit(state.copyWith(
              neighborhoodsSuggestions: newNeighborhoods,
              neighborhoodsSuggestionState: newNeighborhoods.isEmpty &&
                      neighborhoodsHashSet.contains(event.searchText)
                  ? AutoSuggestionState.emptyShowNoSuggestions
                  : AutoSuggestionState.loaded,
            ));
          }
        },
      );
    } else {
      emit(state.copyWith(
          neighborhoodsSuggestionState: AutoSuggestionState.emptyText));
    }
  }
}
