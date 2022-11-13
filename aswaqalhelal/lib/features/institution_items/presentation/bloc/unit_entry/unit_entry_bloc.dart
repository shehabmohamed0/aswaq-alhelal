import 'dart:async';
import 'dart:developer';

import 'package:aswaqalhelal/core/form_inputs/name.dart';
import 'package:bloc/bloc.dart';
import 'package:aswaqalhelal/core/form_inputs/name.dart';
import 'package:aswaqalhelal/core/form_inputs/required_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../../core/extensions/prepare_for_search.dart';
import '../../../../../core/form_inputs/number.dart';
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
    on<InitForEdit>(_onInitForEdit);
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
          sugggestionStatus: AutoSuggestionState.loaded,
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
        sugggestionStatus: AutoSuggestionState.emptyText,
        status: UnitEntryStatus.unitUnselected,
        name: const Name.dirty('')));
  }

  FutureOr<void> _onFromUnitChanged(
      FromUnitChanged event, Emitter<UnitEntryState> emit) {
    emit(state.copyWith(
        fromUnit: RequiredObject.dirty(event.unit),
        status: UnitEntryStatus.fromUnitChanged,
        quantity: event.quantity != null
            ? state.quantity.copyWith(event.quantity!)
            : state.quantity));
  }

  FutureOr<void> _onQuantityChanged(
      QuantityChanged event, Emitter<UnitEntryState> emit) {
    final number = double.tryParse(event.quantity);
    if (number != null) {
      emit(state.copyWith(quantity: state.quantity.copyWith(number)));
    } else {
      emit(state.copyWith(quantity: state.quantity.copyWith(0)));
    }
  }

  FutureOr<void> _onPriceChanged(
      PriceChanged event, Emitter<UnitEntryState> emit) {
    final number = double.tryParse(event.price);
    if (number != null) {
      emit(state.copyWith(price: state.price.copyWith(number)));
    } else {
      emit(state.copyWith(price: state.price.copyWith(0)));
    }
  }

  FutureOr<void> _onUnitAdded(
      UnitAdded event, Emitter<UnitEntryState> emit) async {
    if (state.status == UnitEntryStatus.loading) return;
    emit(state.copyWith(status: UnitEntryStatus.loading));
    log('name : ${state.name.value}');
    final eitherOrUnit = await _addUnitToReference(
        params: AddUnitToReferenceParams(
      name: event.name,
      price: 0,
      quantity: 0,
      p0: 0,
      p1: 0,
      p2: 0,
      p3: 0,
      p4: 0,
    ));

    eitherOrUnit.fold(
        (fialure) => emit(state.copyWith(status: UnitEntryStatus.failure)),
        (unit) => emit(state.copyWith(
            unit: RequiredObject.dirty(unit),
            status: UnitEntryStatus.success)));
  }

  FutureOr<void> _onInitForEdit(
      InitForEdit event, Emitter<UnitEntryState> emit) {
    emit(state.copyWith(
        unit: RequiredObject.dirty(event.unit),
        fromUnit: RequiredObject.dirty(event.unit.baseUnit),
        quantity: const Number.pure(acceptNegative: false, acceptZero: false)
            .copyWith(event.unit.quantity),
        price: const Number.pure(acceptNegative: false, acceptZero: false)
            .copyWith(event.unit.price)));
  }
}
