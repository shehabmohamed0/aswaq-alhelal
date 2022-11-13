import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/extensions/prepare_for_search.dart';
import '../../../../../core/failures/server_failure.dart';
import '../../../../../core/form_inputs/name.dart';
import '../../../../../core/form_inputs/nullable_number.dart';
import '../../../../../core/form_inputs/number.dart';
import '../../../../../core/form_inputs/required_object.dart';
import '../../../domain/entities/unit.dart';
import '../../../domain/repositories/units_repository.dart';
import '../../../domain/usecases/add_unit_to_reference.dart';
import '../../../domain/usecases/get_unit_suggestions.dart';
import '../../DTOs/unit_entry_row.dart';
import '../../pages/add_item/widgets/auto_suggest_text_field.dart';
import '../add_item/add_item_bloc.dart';

part 'units_bloc.freezed.dart';
part 'units_event.dart';
part 'units_state.dart';

int unitEntryComparator(UnitEntryRow a, UnitEntryRow b) {
  if (a.quantityValue > b.quantityValue) {
    return 1;
  } else if (a.quantityValue < b.quantityValue) {
    return -1;
  } else {
    return 0;
  }
}

@injectable
class ItemUnitsBloc extends Bloc<ItemUnitsEvent, ItemUnitsState> {
  ItemUnitsBloc(this._getUnitSuggestions, this._addUnitToReference)
      : super(ItemUnitsState(columnsNeedsRebuild: HashSet())) {
    on<AddUnitEntry>(_onAddUnitEntry);
    on<UnitNameChanged>(_onUnitNameChanged, transformer: debounce());
    on<UnitAdded>(_onUnitAdded);
    on<UnitSelected>(_onUnitSelected);
    on<UnitUnselected>(_onUnitUnselected);
    on<BaseUnitChanged>(_onBaseUnitChanged);
    on<ToggleQuantityClicked>(_onToggleQuantityClicked);
    on<QuantityChanged>(_onQuantityChanged);
    on<PriceChanged>(_onPriceChanged);
    on<UnitEntryRowRemoved>(_onUnitEntryRowRemoved);
    on<InitForEdit>(_onInitForEdit);
    on<ResetUnits>(_onResetUnits);
  }
  final GetUnitSuggestions _getUnitSuggestions;
  final AddUnitToReference _addUnitToReference;
  FutureOr<void> _onAddUnitEntry(
      AddUnitEntry event, Emitter<ItemUnitsState> emit) {
    final List<UnitEntryRow> validList = [];
    final List<UnitEntryRow> inValidList = [];

    _filterUnits(validList, inValidList);

    UnitEntryRow? smallestUnit;

    if (validList.length > 1) {
      _enableQuantityInFirstEntry(validList);
      _sort(validList);
      _disableQuantityInFirstEntry(validList);
      smallestUnit = validList.first;
      if (smallestUnit.isFractionQuantity) {
        _reAsignEntriesQuantities(validList, smallestUnit);
      }
    }

    emit(
      state.copyWith(
        status: inValidList.isEmpty
            ? UnitsStatus.unitEntryAdded
            : UnitsStatus.unitEntrySorted,
        columnsNeedsRebuild: HashSet.from(ColumnType.values),
        baseUnit: RequiredObject.dirty(
            smallestUnit?.selectedUnit.value ?? state.baseUnit.value),
        units: [
          ...validList,
          ...inValidList,
          if (inValidList.isEmpty)
            const UnitEntryRow(
              name: Name.pure(),
              unitSuggestions: [],
              suggestionState: AutoSuggestionState.emptyText,
              selectedUnit: RequiredObject.pure(),
              quantity: Number.quantity(),
              price: Number.price(),
              p1: NullableNumber.purePrice(),
              p2: NullableNumber.purePrice(),
              p3: NullableNumber.purePrice(),
              p4: NullableNumber.purePrice(),
            )
        ],
      ),
    );
  }

  void _filterUnits(
      List<UnitEntryRow> validList, List<UnitEntryRow> inValidList) {
    for (UnitEntryRow entry in state.units) {
      entry.validRow()
          ? validList.add(entry)
          : inValidList.add(entry.validatedCopy());
    }
  }

  void _enableQuantityInFirstEntry(List<UnitEntryRow> validList) {
    validList[0] = validList[0].copyWith(disableQuantity: false);
  }

  void _sort(List<UnitEntryRow> validList) {
    validList.sort(unitEntryComparator);
  }

  void _disableQuantityInFirstEntry(List<UnitEntryRow> validList) {
    validList[0] = validList[0].copyWith(disableQuantity: true);
  }

  void _reAsignEntriesQuantities(
      List<UnitEntryRow> validList, UnitEntryRow smallestUnit) {
    for (int i = 0; i < validList.length; i++) {
      if (i == 0) {
        _disableAndMakeQuantityOne(validList, i);
      } else {
        _calculateNewQuantity(validList, i, smallestUnit);
      }
    }
  }

  void _disableAndMakeQuantityOne(List<UnitEntryRow> validList, int i) {
    validList[i] = validList[i].copyWith(
      quantity: validList[i].quantity.copyWith(1),
      isFractionQuantity: false,
      disableQuantity: true,
    );
  }

  void _calculateNewQuantity(
      List<UnitEntryRow> validList, int i, UnitEntryRow smallestUnit) {
    validList[i] = validList[i].copyWith(
      quantity: validList[i]
          .quantity
          .copyWith(validList[i].quantity.value * smallestUnit.quantity.value),
      isFractionQuantity: false,
      disableQuantity: false,
    );
  }

  FutureOr<void> _onUnitNameChanged(
      UnitNameChanged event, Emitter<ItemUnitsState> emit) async {
    final searchText = event.name.prepareForSearch();
    if (searchText.isEmpty) {
      emit(
        state.copyWith(
          units: _unitsWithChangeAtIndex(
            state.units[event.index].copyWith(
              suggestionState: AutoSuggestionState.emptyText,
              name: Name.dirty(event.name),
              unitSuggestions: [],
            ),
            event.index,
          ),
          columnsNeedsRebuild: HashSet.of([ColumnType.name]),
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        units: _unitsWithChangeAtIndex(
          state.units[event.index].copyWith(
            suggestionState: AutoSuggestionState.loading,
            name: Name.dirty(event.name),
          ),
          event.index,
        ),
        columnsNeedsRebuild: HashSet.of([ColumnType.name]),
      ),
    );

    final suggestionsOrFailure =
        await _getUnitSuggestions(params: GetUnitSuggestionsParams(searchText));
    suggestionsOrFailure.fold(
      (failure) => emit(
        state.copyWith(
          units: _unitsWithChangeAtIndex(
            state.units[event.index].copyWith(
              suggestionState: AutoSuggestionState.error,
            ),
            event.index,
          ),
          columnsNeedsRebuild: HashSet.of([ColumnType.name]),
        ),
      ),
      (units) {
        // log(units.toString());
        if (units.isNotEmpty) {
          final index = units.indexWhere(
              (element) => element.name.prepareForSearch() == searchText);

          if (index == -1) {
            emit(
              state.copyWith(
                units: _unitsWithChangeAtIndex(
                  state.units[event.index].copyWith(
                    unitSuggestions: units,
                    suggestionState: AutoSuggestionState.loadedButCanAdd,
                  ),
                  event.index,
                ),
                columnsNeedsRebuild: HashSet.of([ColumnType.name]),
              ),
            );
            return;
          }
        }

        emit(
          state.copyWith(
            units: _unitsWithChangeAtIndex(
              state.units[event.index].copyWith(
                unitSuggestions: units,
                suggestionState: AutoSuggestionState.loaded,
              ),
              event.index,
            ),
            columnsNeedsRebuild: HashSet.of([ColumnType.name]),
          ),
        );
      },
    );
  }

  List<UnitEntryRow> _unitsWithChangeAtIndex(UnitEntryRow newUnit, int index) {
    final oldUnits = state.units;
    final List<UnitEntryRow> newUnits = [];
    for (int i = 0; i < oldUnits.length; i++) {
      newUnits.add(i == index ? newUnit : oldUnits[i]);
    }
    return newUnits;
  }

  FutureOr<void> _onUnitAdded(
      UnitAdded event, Emitter<ItemUnitsState> emit) async {
    if (state.status == UnitsStatus.loading) return;
    emit(state.copyWith(
      status: UnitsStatus.loading,
    ));

    final unitOrFailure = await _addUnitToReference(
      params: AddUnitToReferenceParams(
        name: event.name,
        quantity: 1,
        price: 0,
        p0: 0,
      ),
    );

    unitOrFailure.fold(
      (failure) => emit(state.copyWith(
          status: UnitsStatus.failure,
          errorMessage: (failure as ServerFailure).message)),
      (unit) {
        if (event.index == 0) {
          emit(
            state.copyWith(
              units: _unitsWithChangeAtIndex(
                state.units[event.index].copyWith(
                  name: Name.dirty(unit.name),
                  selectedUnit: RequiredObject.dirty(unit),
                  quantity: state.units[event.index].quantity.copyWith(1),
                  disableQuantity: true,
                ),
                event.index,
              ),
              index: event.index,
              status: UnitsStatus.firstUnitAddedAndSelected,
              columnsNeedsRebuild: HashSet.of(
                [
                  ColumnType.name,
                  ColumnType.baseUnit,
                  ColumnType.quantity,
                ],
              ),
              baseUnit: RequiredObject.dirty(unit),
            ),
          );
          return null;
        }
        emit(
          state.copyWith(
            units: _unitsWithChangeAtIndex(
              state.units[event.index].copyWith(
                selectedUnit: RequiredObject.dirty(unit),
              ),
              event.index,
            ),
            index: event.index,
            status: UnitsStatus.unitAddedAndSelected,
            columnsNeedsRebuild: HashSet.of(
              [
                ColumnType.name,
                ColumnType.baseUnit,
              ],
            ),
            // baseUnits: Set.of(state.baseUnits)..add(unit),
          ),
        );
      },
    );
  }

  FutureOr<void> _onUnitSelected(
      UnitSelected event, Emitter<ItemUnitsState> emit) {
    if (event.index == 0) {
      emit(
        state.copyWith(
          units: _unitsWithChangeAtIndex(
            state.units[event.index].copyWith(
              name: Name.dirty(event.unit.name),
              selectedUnit: RequiredObject.dirty(event.unit),
              quantity: state.units[event.index].quantity.copyWith(1),
              disableQuantity: true,
            ),
            event.index,
          ),
          index: event.index,
          status: UnitsStatus.firstUnitSelected,
          columnsNeedsRebuild: HashSet.of(
            [
              ColumnType.name,
              ColumnType.baseUnit,
              ColumnType.quantity,
            ],
          ),
          baseUnit: RequiredObject.dirty(event.unit),
        ),
      );
      return null;
    }
    emit(
      state.copyWith(
        units: _unitsWithChangeAtIndex(
          state.units[event.index].copyWith(
            name: Name.dirty(event.unit.name),
            selectedUnit: RequiredObject.dirty(event.unit),
          ),
          event.index,
        ),
        index: event.index,
        status: UnitsStatus.unitSelected,
        columnsNeedsRebuild: HashSet.of(
          [
            ColumnType.name,
            ColumnType.baseUnit,
          ],
        ),
        // baseUnits: Set.of(state.baseUnits)..add(event.unit),
      ),
    );
  }

  FutureOr<void> _onUnitUnselected(
      UnitUnselected event, Emitter<ItemUnitsState> emit) {
    if (_isBaseUnitAt(event.index) && _thereIsMoreThanOneUnit()) {
      add(UnitEntryRowRemoved(index: event.index));
      return null;
    }
    if (_isBaseUnitAt(event.index)) {
      emit(
        state.copyWith(
          units: _unitsWithChangeAtIndex(
            state.units[event.index].copyWith(
              selectedUnit: const RequiredObject.dirty(null),
              name: const Name.dirty(''),
              suggestionState: AutoSuggestionState.emptyText,
              unitSuggestions: [],
            ),
            event.index,
          ),
          index: event.index,
          status: UnitsStatus.unitUnselected,
          baseUnit: const RequiredObject.dirty(null),
          columnsNeedsRebuild: HashSet.of(
            [
              ColumnType.name,
              ColumnType.baseUnit,
            ],
          ),
        ),
      );

      return null;
    }

    emit(
      state.copyWith(
        units: _unitsWithChangeAtIndex(
          state.units[event.index].copyWith(
            selectedUnit: const RequiredObject.dirty(null),
            name: const Name.dirty(''),
            suggestionState: AutoSuggestionState.emptyText,
            unitSuggestions: [],
          ),
          event.index,
        ),
        index: event.index,
        status: UnitsStatus.unitUnselected,
        columnsNeedsRebuild: HashSet.of(
          [
            ColumnType.name,
            ColumnType.baseUnit,
          ],
        ),
      ),
    );
  }

  bool _isBaseUnitAt(int index) =>
      state.units[index].selectedUnit.value == state.baseUnit.value;

  bool _thereIsMoreThanOneUnit() {
    return state.units.length > 1;
  }

  FutureOr<void> _onBaseUnitChanged(
      BaseUnitChanged event, Emitter<ItemUnitsState> emit) {
    emit(
      state.copyWith(
          units: _unitsWithChangeAtIndex(
            state.units[event.index].copyWith(),
            event.index,
          ),
          index: event.index,
          status: UnitsStatus.unitSelected,
          columnsNeedsRebuild: HashSet.of([ColumnType.name])),
    );
  }

  FutureOr<void> _onQuantityChanged(
      QuantityChanged event, Emitter<ItemUnitsState> emit) {
    final quantity = int.tryParse(event.quantity);
    emit(state.copyWith(
        units: _unitsWithChangeAtIndex(
          state.units[event.index].copyWith(
            quantity: state.units[event.index].quantity.copyWith(quantity ?? 0),
            isFractionQuantity: event.isFraction,
          ),
          event.index,
        ),
        index: event.index,
        // status: UnitsStatus.qu,
        columnsNeedsRebuild: HashSet.of([ColumnType.quantity])));
  }

  FutureOr<void> _onPriceChanged(
      PriceChanged event, Emitter<ItemUnitsState> emit) {
    emit(state.copyWith(
        units: _unitsWithChangeAtIndex(
          event.priceIndex == 0
              ? state.units[event.index].copyWithPrice(
                  price: double.tryParse(event.price) ?? 0,
                )
              : state.units[event.index].copyWithP(
                  pIndex: event.priceIndex,
                  parseText: event.price,
                ),
          event.index,
        ),
        index: event.index,
        // status: UnitsStatus.qu,
        columnsNeedsRebuild: HashSet.of([priceColumns[event.priceIndex]])));
  }

  FutureOr<void> _onToggleQuantityClicked(
      ToggleQuantityClicked event, Emitter<ItemUnitsState> emit) {
    emit(state.copyWith(
        units: _unitsWithChangeAtIndex(
          state.units[event.index].copyWith(
            isFractionQuantity: !state.units[event.index].isFractionQuantity,
          ),
          event.index,
        ),
        index: event.index,
        columnsNeedsRebuild: HashSet.of([ColumnType.quantity])));
  }

  FutureOr<void> _onUnitEntryRowRemoved(
      UnitEntryRowRemoved event, Emitter<ItemUnitsState> emit) {
    if (_isBaseUnitAt(event.index)) {
      if (_thereIsMoreThanOneUnit()) {
        final newList = List.of(state.units);
        newList.removeAt(event.index);
        List<UnitEntryRow> validList = [];
        final List<UnitEntryRow> invalidList = [];

        late UnitEntryRow current;
        for (int i = 0; i < newList.length; i++) {
          current = newList[i];
          current.isValidMeasure()
              ? validList.add(current)
              : invalidList.add(current);
        }
        validList.sort(
          (a, b) {
            if (a.quantity.value > b.quantity.value) {
              return 1;
            } else if (a.quantity.value < b.quantity.value) {
              return -1;
            } else {
              return 0;
            }
          },
        );
        final newBaseRow = validList.isNotEmpty
            ? validList.elementAt(0)
            : invalidList.first.copyWith(
                quantity: invalidList.first.quantity.copyWith(1),
                disableQuantity: true,
              );

        validList = validList
            .map(
              (e) => e.copyWith(
                quantity: e.quantity.copyWith(
                  (e.quantity.value / newBaseRow.quantity.value).ceil(),
                ),
                isFractionQuantity: false,
              ),
            )
            .toList();
        if (validList.isNotEmpty) {
          validList[0] = validList[0].copyWith(disableQuantity: true);
        } else {
          invalidList[0] = newBaseRow;
        }
        emit(
          state.copyWith(
            units: [...validList, ...invalidList],
            baseUnit: RequiredObject.dirty(newBaseRow.selectedUnit.value),
            columnsNeedsRebuild: HashSet.from(ColumnType.values),
            status: UnitsStatus.unitRowRemoved,
          ),
        );
      }
    } else {
      emit(
        state.copyWith(
          units: List.of(state.units)..removeAt(event.index),
          columnsNeedsRebuild: HashSet.from(ColumnType.values),
          status: UnitsStatus.unitRowRemoved,
        ),
      );
    }
  }

  FutureOr<void> _onInitForEdit(
      InitForEdit event, Emitter<ItemUnitsState> emit) {
    final list = event.units.map(UnitEntryRow.fromUnit).toList();
    list[0] = list[0].copyWith(disableQuantity: true);

    emit(
      state.copyWith(
        status: UnitsStatus.newUnitsInit,
        units: list,
        baseUnit: RequiredObject.dirty(event.units.first),
        columnsNeedsRebuild: HashSet.from(ColumnType.values),
      ),
    );
  }

  FutureOr<void> _onResetUnits(ResetUnits event, Emitter<ItemUnitsState> emit) {
    emit(ItemUnitsState(
      columnsNeedsRebuild: HashSet.from(ColumnType.values),
      status: UnitsStatus.reset,
    ));
  }
}

const priceColumns = [
  ColumnType.price,
  ColumnType.p1,
  ColumnType.p2,
  ColumnType.p3,
  ColumnType.p4
];
