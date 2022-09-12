import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/packages/stream_transform.dart';

import '../../../../core/params/address_suggestion/params.dart';
import '../../../instutution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../domain/entities/ref_address.dart';
import '../../domain/entities/ref_city.dart';
import '../../domain/entities/ref_neighborhood.dart';
import '../../domain/entities/ref_governate.dart';
import '../../domain/usecases/usecases.dart';

part 'address_suggestions2_bloc.freezed.dart';
part 'address_suggestions2_event.dart';
part 'address_suggestions2_state.dart';

EventTransformer<E> debounce<E>() {
  return (events, mapper) {
    return events.debounce(const Duration(milliseconds: 300)).switchMap(mapper);
  };
}

abstract class AddressSuggestions2Bloc<
        T extends RefAddress,
        SearchParams extends GetRefAddressParams,
        AddParams extends AddRefAddressParams>
    extends Bloc<AddressSuggestions2Event<T, SearchParams, AddParams>,
        AddressSuggestions2State<T>> {
  final UseCase<List<T>, SearchParams> _searchUsecase;
  final UseCase<T, AddParams> _addRefAddressUsecase;

  AddressSuggestions2Bloc(this._searchUsecase, this._addRefAddressUsecase)
      : super(AddressSuggestions2State(
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
      Emitter<AddressSuggestions2State<T>> emit) {
    emit(state.copyWith(
      addressOrNull: some(event.refAddress),
      status: AddressSuggestionsStatus.initEdit,
      addressSearch: event.refAddress.name,
    ));
  }

  FutureOr<void> _onSearchRefAddress(
      SearchRefAddress<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestions2State<T>> emit) async {
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
          log(suggestions.toString());
          emit(state.copyWith(
            suggestions: List.of(suggestions),
            suggestionState: AutoSuggestionState.loaded,
          ));
        },
      );
    } else {
      emit(state.copyWith(suggestionState: AutoSuggestionState.emptyText));
    }
  }

  FutureOr<void> _onSelectRefAddress(
      SelectRefAddress<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestions2State<T>> emit) {
    emit(state.copyWith(
      addressOrNull: some(event.params),
      status: AddressSuggestionsStatus.addressSelected,
    ));
  }

  FutureOr<void> _onAddRefAddress(
      AddRefAddress<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestions2State<T>> emit) async {
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
      Emitter<AddressSuggestions2State<T>> emit) {
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
      Emitter<AddressSuggestions2State<T>> emit) {
    emit(state.copyWith(enabled: true));
  }

  FutureOr<void> _onDisabelAddressSuggestions(
      DisableAddressSuggestions<T, SearchParams, AddParams> event,
      Emitter<AddressSuggestions2State<T>> emit) {
    emit(state.copyWith(enabled: false));
  }
}

@injectable
class GovernatesSuggestionsBloc extends AddressSuggestions2Bloc<RefGovernate,
    GetGovernatesSuggestionsParams, AddNewGovernateParams> {
  GovernatesSuggestionsBloc(GetGovernatesSuggestions searchUsecase,
      AddNewGovernate addRefAddressUsecase)
      : super(searchUsecase, addRefAddressUsecase);
}

@injectable
class CitiesSuggestionsBloc extends AddressSuggestions2Bloc<RefCity,
    GetCitiesSuggestionsParams, AddNewCityParams> {
  CitiesSuggestionsBloc(
      GetCitiesSuggestions searchUsecase, AddNewCity addRefAddressUsecase)
      : super(searchUsecase, addRefAddressUsecase);
}

@injectable
class NeighborhoodsSuggestionsBloc extends AddressSuggestions2Bloc<
    RefNeighborhood,
    GetNeighborhoodsSuggestionsParams,
    AddNewNeighborhoodParams> {
  NeighborhoodsSuggestionsBloc(GetNeighborhoodsSuggestions searchUsecase,
      AddNewNeighborhood addRefAddressUsecase)
      : super(searchUsecase, addRefAddressUsecase);
}
