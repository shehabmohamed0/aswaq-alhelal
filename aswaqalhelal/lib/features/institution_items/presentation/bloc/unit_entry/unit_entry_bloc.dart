import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:root_package/core/form_inputs/number.dart';
import 'package:root_package/core/form_inputs/required_object.dart';
import 'package:root_package/packages/freezed_annotation.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/packages/stream_transform.dart';
import 'package:root_package/root_package.dart' hide Unit;

import '../../../../../core/extensions/prepare_for_search.dart';
import '../../../domain/entities/unit.dart';
import '../../../domain/repositories/units_repository.dart';
import '../../../domain/usecases/add_unit_to_reference.dart';
import '../../../domain/usecases/get_unit_suggestions.dart';
import '../../pages/add_item/widgets/auto_suggest_text_field.dart';

part 'unit_entry_bloc.freezed.dart';
part 'unit_entry_event.dart';
part 'unit_entry_state.dart';

EventTransformer<E> debounce<E>() {
  return (events, mapper) {
    return events.debounce(const Duration(milliseconds: 300)).switchMap(mapper);
  };
}

@injectable
class UnitEntryBloc extends Bloc<UnitEntryEvent, UnitEntryState> {
  UnitEntryBloc(
    this._getUnitSuggestions,
    this._addUnitToReference,
  ) : super(const UnitEntryState()) {
    on<UnitNameChanged>(_onUnitNameChanged, transformer: debounce());
    on<UnitSelected>(_onUnitSelected);
    on<UnitUnselected>(_onUnitUnselected);
    on<FromUnitChanged>(_onFromUnitChanged);
    on<QuantityChanged>(_onQuantityChanged);
    on<PriceChanged>(_onPriceChanged);
    on<UnitAdded>(_onUnitAdded);
  }
  final GetUnitSuggestions _getUnitSuggestions;
  final AddUnitToReference _addUnitToReference;

  FutureOr<void> _onUnitNameChanged(
      UnitNameChanged event, Emitter<UnitEntryState> emit) async {
    final searchText = event.name.prepareForSearch();
    if (searchText.isEmpty) {
      emit(state.copyWith(sugggestionStatus: AutoSuggestionState.emptyText));
      return;
    }
    emit(state.copyWith(sugggestionStatus: AutoSuggestionState.loading));
    final unitsOrFailure =
        await _getUnitSuggestions(params: GetUnitSuggestionsParams(searchText));

    unitsOrFailure.fold(
        (failure) =>
            emit(state.copyWith(sugggestionStatus: AutoSuggestionState.error)),
        (units) {
      if (units.isNotEmpty) {
        final index = units.indexWhere(
            (element) => element.name.prepareForSearch() == searchText);

        if (index == -1) {
          emit(state.copyWith(
            unitSuggestions: units,
            sugggestionStatus: AutoSuggestionState.loadedButCanAdd,
          ));
        } else {
          emit(state.copyWith(
            unitSuggestions: units,
            sugggestionStatus: AutoSuggestionState.loaded,
          ));
        }
      } else {
        emit(state.copyWith(
          unitSuggestions: units,
          sugggestionStatus: AutoSuggestionState.loadedButCanAdd,
        ));
      }
    });
  }

  FutureOr<void> _onUnitSelected(
      UnitSelected event, Emitter<UnitEntryState> emit) {
    emit(state.copyWith(
        unit: RequiredObject.dirty(event.unit),
        status: UnitEntryStatus.unitSelected));
  }

  FutureOr<void> _onUnitUnselected(
      UnitUnselected event, Emitter<UnitEntryState> emit) {
    emit(state.copyWith(
        unit: const RequiredObject.dirty(null),
        status: UnitEntryStatus.unitUnselected,
        name: const Name.dirty('')));
  }

  FutureOr<void> _onFromUnitChanged(
      FromUnitChanged event, Emitter<UnitEntryState> emit) {
    emit(state.copyWith(
        fromUnit: RequiredObject.dirty(event.unit),
        status: UnitEntryStatus.fromUnitChanged));
  }

  FutureOr<void> _onQuantityChanged(
      QuantityChanged event, Emitter<UnitEntryState> emit) {
    final number = double.tryParse(event.quantity);
    if (number != null) {
      emit(state.copyWith(quantity: state.quantity.copyWith(number)));
    }
  }

  FutureOr<void> _onPriceChanged(
      PriceChanged event, Emitter<UnitEntryState> emit) {
    final number = double.tryParse(event.price);
    if (number != null) {
      emit(state.copyWith(quantity: state.price.copyWith(number)));
    }
  }

  FutureOr<void> _onUnitAdded(
      UnitAdded event, Emitter<UnitEntryState> emit) async {
    if (state.status == UnitEntryStatus.loading) return;
    emit(state.copyWith(status: UnitEntryStatus.loading));

    final eitherOrUnit = await _addUnitToReference(
        params: AddUnitToReferenceParams(
      name: state.name.value,
      price: 0,
      quantity: 0,
    ));

    eitherOrUnit.fold(
        (fialure) => emit(state.copyWith(status: UnitEntryStatus.failure)),
        (unit) => emit(state.copyWith(
            unit: RequiredObject.dirty(unit),
            status: UnitEntryStatus.success)));
  }
}
