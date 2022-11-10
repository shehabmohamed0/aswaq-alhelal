part of 'units_bloc.dart';

@freezed
class ItemUnitsState with _$ItemUnitsState {
  const factory ItemUnitsState({
    @Default(unitEntryDefault) List<UnitEntryRow> units,
    @Default(UnitsStatus.initial) UnitsStatus status,
    // This list we will use it in the BlocBuilder
    // buildWhen: to check if it need rebuild
    // we can't set a @Default here because HashSet dont have a const constructor
    required HashSet<ColumnType> columnsNeedsRebuild,
    //index to know which entry row to interact with in bloc listener
    @Default(0) int index,
    @Default(RequiredObject<Unit>.pure()) RequiredObject<Unit> baseUnit,
    @Default('') String errorMessage,
  }) = _ItemUnitsState;
}

enum UnitsStatus {
  initial,
  loading,
  success,
  failure,
  unitAddedAndSelected,
  unitSelected,
  firstUnitAddedAndSelected,
  firstUnitSelected,
  unitUnselected,
  fromUnitChanged,
  unitEntryAdded,
  unitEntrySorted,
  unitRowRemoved,
  newUnitsInit,
  reset
}

enum ColumnType { name, baseUnit, quantity, price, p1, p2, p3, p4 }

extension CheckColumnRebuilds on HashSet<ColumnType> {
  bool containsName() => contains(ColumnType.name);
  bool containsBaseUnit() => contains(ColumnType.baseUnit);
  bool containsQuantity() => contains(ColumnType.quantity);
  bool containsPrice() => contains(ColumnType.price);
  bool containsP1() => contains(ColumnType.p1);
  bool containsP2() => contains(ColumnType.p2);
  bool containsP3() => contains(ColumnType.p3);
  bool containsP4() => contains(ColumnType.p4);
}

const unitEntryDefault = [
  UnitEntryRow(
    name: Name.pure(),
    unitSuggestions: [],
    suggestionState: AutoSuggestionState.emptyText,
    selectedUnit: RequiredObject.pure(),
    quantity: Number.quantity(),
    price: Number.price(),
    p1: NullableNumber<double>.purePrice(),
    p3: NullableNumber<double>.purePrice(),
    p2: NullableNumber<double>.purePrice(),
    p4: NullableNumber<double>.purePrice(),
  ),
];
