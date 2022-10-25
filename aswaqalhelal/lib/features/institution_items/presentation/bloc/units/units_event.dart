part of 'units_bloc.dart';

@freezed
abstract class UnitsEvent with _$UnitsEvent {
  const factory UnitsEvent.unitNameChanged({
    required String name,
    required int index,
  }) = UnitNameChanged;
  const factory UnitsEvent.unitAdded(
    String name,
    int index,
  ) = UnitAdded;
  const factory UnitsEvent.unitSelected(
      {required Unit unit, required int index}) = UnitSelected;
  const factory UnitsEvent.unitUnselected({required int index}) =
      UnitUnselected;
  const factory UnitsEvent.fromUnitChanged(
      {required Unit unit,
      required int index,
      double? quantity}) = FromUnitChanged;
  const factory UnitsEvent.quantityChanged({
    required String quantity,
    required int index,
  }) = QuantityChanged;
  const factory UnitsEvent.priceChanged({
    required String price,
    required int index,
  }) = PriceChanged;
  const factory UnitsEvent.initForEdit({
    required Unit unit,
    required int index,
  }) = InitForEdit;
}
