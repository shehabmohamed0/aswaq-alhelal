part of 'units_bloc.dart';

@freezed
abstract class ItemUnitsEvent with _$ItemUnitsEvent {
  const factory ItemUnitsEvent.unitNameChanged({
    required String name,
    required int index,
  }) = UnitNameChanged;

  const factory ItemUnitsEvent.unitAdded(
    String name,
    int index,
  ) = UnitAdded;

  const factory ItemUnitsEvent.addUnitEntry() = AddUnitEntry;

  const factory ItemUnitsEvent.unitSelected({
    required Unit unit,
    required int index,
  }) = UnitSelected;

  const factory ItemUnitsEvent.unitUnselected({required int index}) =
      UnitUnselected;

  const factory ItemUnitsEvent.baseUnitChanged({
    required Unit unit,
    required int index,
    double? quantity,
  }) = BaseUnitChanged;

  const factory ItemUnitsEvent.quantityChanged({
    required String quantity,
    required bool isFraction,
    required int index,
  }) = QuantityChanged;

  const factory ItemUnitsEvent.toggleQuantityClicked({
    required int index,
  }) = ToggleQuantityClicked;

  const factory ItemUnitsEvent.priceChanged({
    required String price,
    required int index,
    required int priceIndex,
  }) = PriceChanged;

  const factory ItemUnitsEvent.unitEntryRowRemoved({
    required int index,
  }) = UnitEntryRowRemoved;

  const factory ItemUnitsEvent.initForEdit({
    required List<Unit> units,
  }) = InitForEdit;

  const factory ItemUnitsEvent.resetUnits() = ResetUnits;
}
