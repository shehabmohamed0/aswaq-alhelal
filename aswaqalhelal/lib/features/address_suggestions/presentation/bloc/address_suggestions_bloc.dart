import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../core/extensions/prepare_for_search.dart';
import '../../../../core/params/address_suggestion/params.dart';
import '../../../institution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../domain/entities/ref_address.dart';
import '../../domain/entities/ref_city.dart';
import '../../domain/entities/ref_governate.dart';
import '../../domain/entities/ref_neighborhood.dart';
import '../../domain/usecases/usecases.dart';

part 'address_suggestions_bloc.freezed.dart';
part 'address_suggestions_event.dart';
part 'address_suggestions_state.dart';

EventTransformer<E> debounce<E>() {
  return (events, mapper) {
    return events.debounce(const Duration(milliseconds: 300)).switchMap(mapper);
  };
}

abstract class AddressSuggestionsBloc<
        T extends RefAddress,
        SearchParams extends GetRefAddressParams,
        AddParams extends AddRefAddressParams>
    extends Bloc<AddressSuggestionsEvent<T, SearchParams, AddParams>,
        AddressSuggestionsState<T>> {
  final UseCase<List<T>, SearchParams> _searchUsecase;
  final UseCase<T, AddParams> _addRefAddressUsecase;

  AddressSuggestionsBloc(this._searchUsecase, this._addRefAddressUsecase)
      : super(AddressSuggestionsState(
            addressOrNull: None<T>(), suggestions: const [])) {
    on<InitEdit<T, SearchParams, AddParams>>(_onInitEdit);

    on<SearchRefAddress<T, SearchParams, AddParams>>(_onSearchRefAddress,
        transformer: debounce());
    on<SelectRefAddress<T, SearchParams, AddParams>>(_onSelectRefAddress);
    on<AddRefAddress<T, SearchParams, AddParams>>(_onAddRefAddress);
    on<UnSelectRefAddress<T, SearchParams, AddParams>>(_onUnSelectRefAddress);
    on<EnableAddressSuggestions<T, SearchParams, AddParams>>(
        _onEnabelAddressSuggestions);
    on<DisableAddressSuggestions<T, SearchParams, AddParams>>(
        _onDisabelAddressSuggestions);
  }

  FutureOr<void> _onInitEdit(InitEdit<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestionsState<T>> emit) {
    emit(state.copyWith(
      addressOrNull: some(event.refAddress),
      status: AddressSuggestionsStatus.initEdit,
      addressSearch: event.refAddress.name,
    ));
  }

  FutureOr<void> _onSearchRefAddress(
      SearchRefAddress<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestionsState<T>> emit) async {
    if (event.searchText.trim().length > 2) {
      emit(state.copyWith(
        suggestionState: AutoSuggestionState.loading,
      ));
      final failureOrSuggestions = await _searchUsecase(params: event.params);

      failureOrSuggestions.fold(
        (failure) => emit(state.copyWith(
          suggestionState: AutoSuggestionState.error,
        )),
        (suggestions) {
          final index = suggestions.indexWhere((element) =>
              element.name.prepareForSearch() ==
              event.searchText.prepareForSearch());

          emit(state.copyWith(
            suggestions: List.of(suggestions),
            suggestionState: index != -1
                ? AutoSuggestionState.loaded
                : AutoSuggestionState.loadedButCanAdd,
          ));
        },
      );
    } else {
      emit(state.copyWith(suggestionState: AutoSuggestionState.emptyText));
    }
  }

  FutureOr<void> _onSelectRefAddress(
      SelectRefAddress<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestionsState<T>> emit) {
    emit(state.copyWith(
      addressOrNull: some(event.params),
      status: AddressSuggestionsStatus.addressSelected,
    ));
  }

  FutureOr<void> _onAddRefAddress(
      AddRefAddress<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestionsState<T>> emit) async {
    emit(state.copyWith(status: AddressSuggestionsStatus.loading));

    final either = await _addRefAddressUsecase(params: event.params);
    either.fold(
      (failure) {
        emit(state.copyWith(
            status: AddressSuggestionsStatus.failure,
            errorMessage: (failure as ServerFailure).message));
      },
      (refGovernate) => emit(state.copyWith(
        addressOrNull: Some<T>(refGovernate),
        status: AddressSuggestionsStatus.addingAddressSucess,
      )),
    );
  }

  FutureOr<void> _onUnSelectRefAddress(
      UnSelectRefAddress<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestionsState<T>> emit) {
    emit(state.copyWith(
      addressOrNull: none(),
      status: AddressSuggestionsStatus.addressUnSelected,
      suggestionState: AutoSuggestionState.emptyText,
      suggestions: [],
      enabled: event.enabled,
    ));
  }

  FutureOr<void> _onEnabelAddressSuggestions(
      EnableAddressSuggestions<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestionsState<T>> emit) {
    emit(state.copyWith(enabled: true));
  }

  FutureOr<void> _onDisabelAddressSuggestions(
      DisableAddressSuggestions<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestionsState<T>> emit) {
    emit(state.copyWith(enabled: false));
  }
}

@injectable
class GovernatesSuggestionsBloc extends AddressSuggestionsBloc<RefGovernate,
    GetGovernatesSuggestionsParams, AddNewGovernateParams> {
  GovernatesSuggestionsBloc(GetGovernatesSuggestions searchUsecase,
      AddNewGovernate addRefAddressUsecase)
      : super(searchUsecase, addRefAddressUsecase);
}

@injectable
class CitiesSuggestionsBloc extends AddressSuggestionsBloc<RefCity,
    GetCitiesSuggestionsParams, AddNewCityParams> {
  CitiesSuggestionsBloc(
      GetCitiesSuggestions searchUsecase, AddNewCity addRefAddressUsecase)
      : super(searchUsecase, addRefAddressUsecase);
}

@injectable
class NeighborhoodsSuggestionsBloc extends AddressSuggestionsBloc<
    RefNeighborhood,
    GetNeighborhoodsSuggestionsParams,
    AddNewNeighborhoodParams> {
  NeighborhoodsSuggestionsBloc(GetNeighborhoodsSuggestions searchUsecase,
      AddNewNeighborhood addRefAddressUsecase)
      : super(searchUsecase, addRefAddressUsecase);
}
