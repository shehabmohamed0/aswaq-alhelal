import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/stream_transform.dart';

import '../../../../core/params/address_suggestion/params.dart';
import '../../../instutution_items/presentation/pages/add_item/widgets/auto_suggest_text_field.dart';
import '../../domain/entities/ref_address.dart';
import '../../domain/entities/ref_city.dart';
import '../../domain/entities/ref_district.dart';
import '../../domain/entities/ref_governate.dart';
import '../../domain/usecases/interfaces.dart';

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
        S extends GetRefAddressSuggestionsUsecase<T, SP>,
        SP extends GetRefAddressParams,
        A extends AddRefAddressUsecase<T, AP>,
        AP extends AddRefAddressParams>
    extends Bloc<AddressSuggestions2Event<T, SP, AP>,
        AddressSuggestions2State<T>> {
  final S _searchUsecase;
  final A _addRefAddressUsecase;

  AddressSuggestions2Bloc(this._searchUsecase, this._addRefAddressUsecase)
      : super(const AddressSuggestions2State()) {
    on<SearchRefAddress<T, SP, AP>>(_onSearchRefAddress,
        transformer: debounce());
    on<SelectRefAddress<T, SP, AP>>(_onSelectRefAddress);
    on<AddRefAddress<T, SP, AP>>(_onAddRefAddress);
    on<UnSelectRefAddress<T, SP, AP>>(_onUnSelectRefAddress);
    on<EnableAddressSuggestions<T, SP, AP>>(_onEnabelAddressSuggestions);
    on<DisableAddressSuggestions<T, SP, AP>>(_onDisabelAddressSuggestions);
  }
  FutureOr<void> _onSearchRefAddress(SearchRefAddress<T, SP, AP> event,
      Emitter<AddressSuggestions2State<T>> emit) async {
    if (event.searchText.length > 2) {
      emit(state.copyWith(
        suggestionState: AutoSuggestionState.loading,
      ));
      final failureOrGovernates =
          await _searchUsecase.execute(params: event.params);

      failureOrGovernates.fold(
        (failure) => emit(state.copyWith(
          suggestionState: AutoSuggestionState.error,
        )),
        (governates) => emit(state.copyWith(
          suggestions: governates,
          suggestionState: AutoSuggestionState.loaded,
        )),
      );
    } else {
      emit(state.copyWith(suggestionState: AutoSuggestionState.emptyText));
    }
  }

  FutureOr<void> _onSelectRefAddress(SelectRefAddress<T, SP, AP> event,
      Emitter<AddressSuggestions2State<T>> emit) {
    emit(state.copyWith(
      addressOrNull: some(event.params),
      status: AddressSuggestionsStatus.addressSelected,
    ));
  }

  FutureOr<void> _onAddRefAddress(AddRefAddress<T, SP, AP> event,
      Emitter<AddressSuggestions2State<T>> emit) async {
    emit(state.copyWith(status: AddressSuggestionsStatus.loading));

    final either = await _addRefAddressUsecase.execute(params: event.params);
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

  FutureOr<void> _onUnSelectRefAddress(UnSelectRefAddress<T, SP, AP> event,
      Emitter<AddressSuggestions2State<T>> emit) {
    emit(state.copyWith(
      addressOrNull: none(),
      status: AddressSuggestionsStatus.addressUnSelected,
    ));
  }

  FutureOr<void> _onEnabelAddressSuggestions(
      EnableAddressSuggestions<T, SP, AP> event,
      Emitter<AddressSuggestions2State<T>> emit) {
    emit(state.copyWith(enabled: true));
  }

  FutureOr<void> _onDisabelAddressSuggestions(
      DisableAddressSuggestions<T, SP, AP> event,
      Emitter<AddressSuggestions2State<T>> emit) {
    emit(state.copyWith(enabled: false));
  }
}

class GovernatesSuggestionsBloc extends AddressSuggestions2Bloc<
    RefGovernate,
    GetGovernatesSuggestions,
    GetGovernatesSuggestionsParams,
    AddRefGovernate,
    AddNewGovernateParams> {
  GovernatesSuggestionsBloc(GetGovernatesSuggestions searchUsecase,
      AddRefGovernate addRefAddressUsecase)
      : super(searchUsecase, addRefAddressUsecase);
}

class CitiesSuggestionsBloc extends AddressSuggestions2Bloc<
    RefCity,
    GetCitiesSuggestions,
    GetCitiesSuggestionsParams,
    AddRefCity,
    AddNewCityParams> {
  CitiesSuggestionsBloc(
      GetCitiesSuggestions searchUsecase, AddRefCity addRefAddressUsecase)
      : super(searchUsecase, addRefAddressUsecase);
}

class NeighborhoodsSuggestionsBloc extends AddressSuggestions2Bloc<
    RefNeighborhood,
    GetNeighborhoodsSuggestions,
    GetNeighborhoodsSuggestionsParams,
    AddRefNeighborhood,
    AddNewNeighborhoodParams> {
  NeighborhoodsSuggestionsBloc(GetNeighborhoodsSuggestions searchUsecase,
      AddRefNeighborhood addRefAddressUsecase)
      : super(searchUsecase, addRefAddressUsecase);
}
