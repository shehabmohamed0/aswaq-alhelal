import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/packages/stream_transform.dart';
import 'package:root_package/root_package.dart' hide Unit;

import '../../../domain/entities/unit.dart';
import '../../../domain/repositories/units_repository.dart';
import '../../../domain/usecases/add_unit_to_reference.dart';
import '../../../domain/usecases/get_unit_suggestions.dart';
import '../../pages/add_item/widgets/auto_suggest_text_field.dart';

part 'add_unit_bloc.freezed.dart';
part 'add_unit_event.dart';
part 'add_unit_state.dart';

EventTransformer<E> debounce<E>() {
  return (events, mapper) {
    return events.debounce(const Duration(milliseconds: 300)).switchMap(mapper);
  };
}

@injectable
class AddUnitBloc extends Bloc<AddUnitEvent, AddUnitState> {
  AddUnitBloc(this._getUnitSuggestions, this._addUnitToReference)
      : super(const AddUnitState()) {
    on<SearchName>(_onSearchName, transformer: debounce());
    on<UnitNameChanged>(_onUnitNameChanged, transformer: debounce());
    on<UnitQuantityChanged>(_onUnitQuantityChanged);
    on<UnitPriceChanged>(_onUnitPriceChanged);
    on<UnitSelected>(_onUnitSelected);
    on<UnitUnSelected>(_onUnitUnSelected);
    on<FormSubmitted>(_onFormSubmitted);
  }

  final GetUnitSuggestions _getUnitSuggestions;
  final AddUnitToReference _addUnitToReference;
  FutureOr<void> _onSearchName(
      SearchName event, Emitter<AddUnitState> emit) async {
    if (event.name.trim().isEmpty) {
      emit(state.copyWith(suggestionState: AutoSuggestionState.emptyText));
      return;
    }
    emit(state.copyWith(suggestionState: AutoSuggestionState.loading));

    final either =
        await _getUnitSuggestions(params: GetUnitSuggestionsParams(event.name));

    either.fold(
        (failure) =>
            emit(state.copyWith(suggestionState: AutoSuggestionState.error)),
        (units) {
      final searchNameExists = units.indexWhere((element) =>
              element.name.trim().toLowerCase() ==
              event.name.trim().toLowerCase()) !=
          -1;
      emit(state.copyWith(
          suggestions: units,
          suggestionState: searchNameExists
              ? AutoSuggestionState.loaded
              : AutoSuggestionState.loadedButCanAdd));
    });
  }

  FutureOr<void> _onUnitQuantityChanged(
      UnitQuantityChanged event, Emitter<AddUnitState> emit) {
    final quantity = int.tryParse(event.quantity);
    if (quantity != null) {
      emit(state.copyWith(quantity: quantity));
    }
  }

  FutureOr<void> _onUnitPriceChanged(
      UnitPriceChanged event, Emitter<AddUnitState> emit) {
    final price = double.tryParse(event.price);
    if (price != null) {
      emit(state.copyWith(price: price));
    }
  }

  FutureOr<void> _onUnitSelected(
      UnitSelected event, Emitter<AddUnitState> emit) {
    emit(state.copyWith(
        selectedReferenceUnit: some(event.unit),
        enabled: false,
        status: AddUnitStatus.referenceUnitSelected,
        quantity: event.unit.quantity.toInt(),
        price: event.unit.price));
  }

  FutureOr<void> _onUnitUnSelected(
      UnitUnSelected event, Emitter<AddUnitState> emit) {
    emit(state.copyWith(
        name: '',
        suggestionState: AutoSuggestionState.emptyText,
        selectedReferenceUnit: none(),
        enabled: true,
        status: AddUnitStatus.referenceUnitUnselected));
  }

  FutureOr<void> _onUnitNameChanged(
      UnitNameChanged event, Emitter<AddUnitState> emit) {
    emit(state.copyWith(
      name: event.name,
      enabled: false,
      selectedReferenceUnit: none(),
    ));
  }

  FutureOr<void> _onFormSubmitted(
      FormSubmitted event, Emitter<AddUnitState> emit) async {
    if (state.selectedReferenceUnit.isSome()) {
      final selectedUnit = state.selectedReferenceUnit.toNullable()!;
      final finalUnit = Unit(
        referenceId: selectedUnit.referenceId,
        name: selectedUnit.name,
        quantity: state.quantity.toDouble(),
        price: state.price,
      );
      emit(state.copyWith(
        status: AddUnitStatus.loaded,
        finalUnit: finalUnit,
      ));
    } else {
      if (state.status == AddUnitStatus.loading) return;
      emit(state.copyWith(status: AddUnitStatus.loading));
      final either = await _addUnitToReference(
          params: AddUnitToReferenceParams(
              name: state.name, quantity: state.quantity, price: state.price));

      either.fold(
        (failure) => emit(state.copyWith(
            errorMessage: (failure as ServerFailure).message,
            status: AddUnitStatus.failure)),
        (unit) => emit(state.copyWith(
          status: AddUnitStatus.loaded,
          finalUnit: unit,
        )),
      );
    }
  }
}
