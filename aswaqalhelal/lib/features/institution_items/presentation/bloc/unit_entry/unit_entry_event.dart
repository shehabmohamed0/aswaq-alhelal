part of 'unit_entry_bloc.dart';

@freezed
abstract class UnitEntryEvent with _$UnitEntryEvent {
  const factory UnitEntryEvent.unitNameChanged({required String name}) =
      UnitNameChanged;
  const factory UnitEntryEvent.unitAdded(String name) = UnitAdded;
  const factory UnitEntryEvent.unitSelected({required Unit unit}) =
      UnitSelected;
  const factory UnitEntryEvent.unitUnselected() = UnitUnselected;
  const factory UnitEntryEvent.fromUnitChanged({
    required Unit unit,
    double? quantity
  }) = FromUnitChanged;
  const factory UnitEntryEvent.quantityChanged({required String quantity}) =
      QuantityChanged;
  const factory UnitEntryEvent.priceChanged({required String price}) =
      PriceChanged;
  const factory UnitEntryEvent.initForEdit({required Unit unit}) = InitForEdit;
}
