import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/packages/stream_transform.dart';

import '../../../../core/params/address_suggestion/params.dart';
import '../../../address/domain/entities/geo_point.dart';
import '../../../instutution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../domain/entities/ref_city.dart';
import '../../domain/entities/ref_neighborhood.dart';
import '../../domain/entities/ref_governate.dart';
import '../../domain/usecases/add_new_city.dart';
import '../../domain/usecases/add_new_governate.dart';
import '../../domain/usecases/add_new_neighborhood.dart';
import '../../domain/usecases/get_cities_suggetsions.dart';
import '../../domain/usecases/get_districts_suggestions.dart';
import '../../domain/usecases/get_governates_suggestions.dart';

part 'address_suggestions_bloc.freezed.dart';
part 'address_suggestions_event.dart';
part 'address_suggestions_state.dart';

EventTransformer<E> debounce<E>() {
  return (events, mapper) {
    return events.debounce(const Duration(milliseconds: 300)).switchMap(mapper);
  };
}

@injectable
class AddressSuggestionsBloc
    extends Bloc<AddressSuggestionsEvent, AddressSuggestionsState> {
  final GetGovernatesSuggestions _getGovernatesSuggestions;
  final GetCitiesSuggestions _getCitiesSuggestions;
  final GetNeighborhoodsSuggestions _getNeighborhoodsSuggestions;
  final AddNewGovernate _addNewGovernate;
  final AddNewCity _addNewCity;
  final AddNewNeighborhood _addNewNeighborhood;

  AddressSuggestionsBloc(
      this._getGovernatesSuggestions,
      this._getCitiesSuggestions,
      this._getNeighborhoodsSuggestions,
      this._addNewGovernate,
      this._addNewCity,
      this._addNewNeighborhood)
      : super(const AddressSuggestionsState()) {
    on<AddressSuggestionsEvent>(_onNormalAddressSuggestionsEvent);

    on<SearchGovernate>(_onSearchGovernate, transformer: debounce());
    on<SearchCity>(_onSearchCity, transformer: debounce());
    on<SearchNeighborhood>(_onSearchNeighborhood, transformer: debounce());
  }

  FutureOr<void> _onNormalAddressSuggestionsEvent(AddressSuggestionsEvent event,
      Emitter<AddressSuggestionsState> emit) async {
    await event.mapOrNull(
      selectGovernate: (event) async {
        emit(state.copyWith(
          governateOrNull: some(event.governate),
          status: AddressSuggestionsStatus.governateSelected,
        ));
      },
      selectCity: (event) async {
        emit(state.copyWith(
          cityOrNull: some(event.city),
          status: AddressSuggestionsStatus.citySelected,
        ));
      },
      selectNeighborhood: (event) async {
        emit(state.copyWith(
          neighborhoodOrNull: some(event.neighborhood),
          status: AddressSuggestionsStatus.neighborhoodSelected,
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
          status: AddressSuggestionsStatus.governateUnSelected,
        ));
      },
      unSelectCity: (event) async {
        emit(state.copyWith(
          cityOrNull: none(),
          neighborhoodOrNull: none(),
          citiesSuggestionState: AutoSuggestionState.emptyText,
          neighborhoodsSuggestionState: AutoSuggestionState.emptyText,
          status: AddressSuggestionsStatus.cityUnSelected,
        ));
      },
      unSelectNeighborhood: (event) async {
        emit(state.copyWith(
          neighborhoodOrNull: none(),
          neighborhoodsSuggestionState: AutoSuggestionState.emptyText,
          status: AddressSuggestionsStatus.neighborhoodUnSelected,
        ));
      },
    );
  }

  Future<void> _onAddNewGovernate(
      AddNewGovernateEvent event, Emitter<AddressSuggestionsState> emit) async {
    emit(state.copyWith(status: AddressSuggestionsStatus.loading));

    final either = await _addNewGovernate(
      params: AddNewGovernateParams(
        country: 'egypt',
        governate: event.governate,
      ),
    );
    either.fold(
      (failure) {
        //TODO:
      },
      (refGovernate) => emit(state.copyWith(
        governateOrNull: some(refGovernate),
        status: AddressSuggestionsStatus.addingGovernateSucess,
      )),
    );
  }

  Future<void> _onAddNewCity(
      AddNewCityEvent event, Emitter<AddressSuggestionsState> emit) async {
    emit(state.copyWith(status: AddressSuggestionsStatus.loading));
    final either = await _addNewCity(
      params: AddNewCityParams(
        country: 'egypt',
        refGovernate: state.governateOrNull.toNullable()!,
        city: event.city,
      ),
    );
    either.fold(
      (failure) {},
      (refCity) => emit(state.copyWith(
        cityOrNull: some(refCity),
        status: AddressSuggestionsStatus.addingCitySuccess,
      )),
    );
  }

  Future<void> _onAddNewNeighborhood(AddNewNeighborhoodEvent event,
      Emitter<AddressSuggestionsState> emit) async {
    emit(state.copyWith(status: AddressSuggestionsStatus.loading));

    final either = await _addNewNeighborhood(
      params: AddNewNeighborhoodParams(
        country: 'egypt',
        refGovernate: state.governateOrNull.fold(() => null, (a) => a)!,
        refCity: state.cityOrNull.fold(() => null, (a) => a)!,
        neighborhood: event.neighborhood,
      ),
    );
    either.fold(
      (failure) {},
      (refNeighborhood) => emit(state.copyWith(
        neighborhoodOrNull: some(refNeighborhood),
        status: AddressSuggestionsStatus.addingNeighborhoodSuccess,
      )),
    );
  }

  FutureOr<void> _onSearchGovernate(
      SearchGovernate event, Emitter<AddressSuggestionsState> emit) async {
    if (event.searchText.length > 2) {
      emit(state.copyWith(
        governatesSuggestionState: AutoSuggestionState.loading,
      ));
      final failureOrGovernates = await _getGovernatesSuggestions(
          params: GetGovernatesSuggestionsParams(
        country: 'egypt',
        searchText: event.searchText,
      ));

      failureOrGovernates.fold(
        (failure) => emit(state.copyWith(
          governatesSuggestionState: AutoSuggestionState.error,
        )),
        (governates) => emit(state.copyWith(
          governatesSuggestions: governates,
          governatesSuggestionState: AutoSuggestionState.loaded,
        )),
      );
    } else {
      emit(state.copyWith(
          governatesSuggestionState: AutoSuggestionState.emptyText));
    }
  }

  FutureOr<void> _onSearchCity(
      SearchCity event, Emitter<AddressSuggestionsState> emit) async {
    if (event.searchText.length > 2) {
      emit(state.copyWith(
        citiesSuggestionState: AutoSuggestionState.loading,
      ));
      final failureOrGovernates = await _getCitiesSuggestions(
          params: GetCitiesSuggestionsParams(
        country: 'egypt',
        governate: state.governateOrNull.toNullable()!.name,
        searchText: event.searchText,
      ));

      failureOrGovernates.fold(
        (failure) => emit(state.copyWith(
          citiesSuggestionState: AutoSuggestionState.error,
        )),
        (cities) => emit(state.copyWith(
          citiesSuggestions: cities,
          citiesSuggestionState: AutoSuggestionState.loaded,
        )),
      );
    } else {
      emit(
          state.copyWith(citiesSuggestionState: AutoSuggestionState.emptyText));
    }
  }

  FutureOr<void> _onSearchNeighborhood(
      SearchNeighborhood event, Emitter<AddressSuggestionsState> emit) async {
    if (event.searchText.length > 2) {
      emit(state.copyWith(
        neighborhoodsSuggestionState: AutoSuggestionState.loading,
      ));
      final failureOrGovernates = await _getNeighborhoodsSuggestions(
          params: GetNeighborhoodsSuggestionsParams(
        country: 'egypt',
        governate: state.governateOrNull.toNullable()!.name,
        city: state.cityOrNull.toNullable()!.name,
        searchText: event.searchText,
      ));

      failureOrGovernates.fold(
        (failure) => emit(state.copyWith(
          neighborhoodsSuggestionState: AutoSuggestionState.error,
        )),
        (neighborhoods) => emit(state.copyWith(
          neighborhoodsSuggestions: neighborhoods,
          neighborhoodsSuggestionState: AutoSuggestionState.loaded,
        )),
      );
    } else {
      emit(state.copyWith(
          neighborhoodsSuggestionState: AutoSuggestionState.emptyText));
    }
  }
}
