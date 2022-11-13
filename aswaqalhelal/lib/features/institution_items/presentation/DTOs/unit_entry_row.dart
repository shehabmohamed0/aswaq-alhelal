import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:aswaqalhelal/core/form_inputs/name.dart';
import 'package:aswaqalhelal/core/form_inputs/required_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/form_inputs/nullable_number.dart';
import '../../../../core/form_inputs/number.dart';
import '../../domain/entities/unit.dart';
import '../pages/add_item/widgets/auto_suggest_text_field.dart';

@immutable
class UnitEntryRow extends Equatable {
  final Name name;
  final List<Unit> unitSuggestions;
  final AutoSuggestionState suggestionState;
  final RequiredObject<Unit> selectedUnit;
  final Number quantity;
  final bool isFractionQuantity;
  final bool disableQuantity;
  final Number price;
  final NullableNumber<double> p1;
  final NullableNumber<double> p2;
  final NullableNumber<double> p3;
  final NullableNumber<double> p4;
  const UnitEntryRow({
    required this.name,
    required this.unitSuggestions,
    required this.suggestionState,
    required this.selectedUnit,
    required this.quantity,
    this.disableQuantity = false,
    this.isFractionQuantity = false,
    required this.price,
    required this.p1,
    required this.p2,
    required this.p3,
    required this.p4,
  });

  @override
  List<Object> get props {
    return [
      name,
      unitSuggestions,
      suggestionState,
      selectedUnit,
      quantity,
      isFractionQuantity,
      disableQuantity,
      price,
      p1,
      p2,
      p3,
      p4,
    ];
  }

  double get quantityValue => isFractionQuantity
      ? 1 / (quantity.value + 0.000001)
      : quantity.value.toDouble();
  bool isValidMeasure() {
    return selectedUnit.value != null && quantity.valid;
  }

  bool isPure() =>
      name.pure &&
      selectedUnit.pure &&
      quantity.pure &&
      price.pure &&
      p1.pure &&
      p2.pure &&
      p3.pure &&
      p4.pure;

  bool validRow() {
    return selectedUnit.value != null &&
        quantity.valid &&
        price.valid &&
        p1.valid &&
        p2.valid &&
        p3.valid &&
        p4.valid;
  }

  Unit toUnit(Unit baseUnit) {
    if (!validRow()) throw Exception();

    return Unit(
        referenceId: selectedUnit.value!.referenceId,
        name: selectedUnit.value!.name,
        quantity: quantity.value.toDouble(),
        price: price.value.toDouble(),
        p0: price.value.toDouble(),
        p1: p1.value,
        p2: p2.value,
        p3: p3.value,
        p4: p4.value,
        baseUnit: baseUnit);
  }

  UnitEntryRow validatedCopy() => UnitEntryRow(
        name: name,
        unitSuggestions: unitSuggestions,
        suggestionState: suggestionState,
        selectedUnit: RequiredObject.dirty(selectedUnit.value),
        quantity: quantity.copyWith(quantity.value),
        price: price.copyWith(price.value),
        p1: NullableNumber.dirtyPrice(number: p1.value),
        p2: NullableNumber.dirtyPrice(number: p2.value),
        p3: NullableNumber.dirtyPrice(number: p3.value),
        p4: NullableNumber.dirtyPrice(number: p4.value),
        disableQuantity: disableQuantity,
        isFractionQuantity: isFractionQuantity,
      );

  UnitEntryRow copyWith({
    Name? name,
    List<Unit>? unitSuggestions,
    AutoSuggestionState? suggestionState,
    RequiredObject<Unit>? selectedUnit,
    Number? quantity,
    bool? isFractionQuantity,
    bool? disableQuantity,
    Number? price,
    NullableNumber<double>? p1,
    NullableNumber<double>? p2,
    NullableNumber<double>? p3,
    NullableNumber<double>? p4,
  }) {
    return UnitEntryRow(
      name: name ?? this.name,
      unitSuggestions: unitSuggestions ?? this.unitSuggestions,
      suggestionState: suggestionState ?? this.suggestionState,
      selectedUnit: selectedUnit ?? this.selectedUnit,
      quantity: quantity ?? this.quantity,
      isFractionQuantity: isFractionQuantity ?? this.isFractionQuantity,
      disableQuantity: disableQuantity ?? this.disableQuantity,
      price: price ?? this.price,
      p1: p1 ?? this.p1,
      p2: p2 ?? this.p2,
      p3: p3 ?? this.p3,
      p4: p4 ?? this.p4,
    );
  }

  factory UnitEntryRow.fromUnit(Unit unit) => UnitEntryRow(
        name: Name.dirty(unit.name),
        unitSuggestions: const [],
        suggestionState: AutoSuggestionState.emptyText,
        selectedUnit: RequiredObject.dirty(unit),
        quantity: const Number.quantity().copyWith(unit.quantity.toInt()),
        price: const Number.price().copyWith(unit.price),
        p1: NullableNumber<double>.dirtyPrice(number: unit.p1),
        p2: NullableNumber<double>.dirtyPrice(number: unit.p2),
        p3: NullableNumber<double>.dirtyPrice(number: unit.p3),
        p4: NullableNumber<double>.dirtyPrice(number: unit.p4),
      );

  UnitEntryRow copyWithPrice({
    required num price,
  }) {
    return UnitEntryRow(
      name: name,
      unitSuggestions: unitSuggestions,
      suggestionState: suggestionState,
      selectedUnit: selectedUnit,
      quantity: quantity,
      disableQuantity: disableQuantity,
      isFractionQuantity: isFractionQuantity,
      price: this.price.copyWith(price),
      p1: p1,
      p2: p2,
      p3: p3,
      p4: p4,
    );
    // }
  }

  UnitEntryRow copyWithP({
    required int pIndex,
    required String parseText,
  }) {
    if (pIndex == 1) {
      return UnitEntryRow(
        name: name,
        unitSuggestions: unitSuggestions,
        suggestionState: suggestionState,
        selectedUnit: selectedUnit,
        quantity: quantity,
        disableQuantity: disableQuantity,
        isFractionQuantity: isFractionQuantity,
        price: price,
        p1: NullableNumber.dirtyStringPrice(priceText: parseText),
        p2: p2,
        p3: p3,
        p4: p4,
      );
    } else if (pIndex == 2) {
      return UnitEntryRow(
        name: name,
        unitSuggestions: unitSuggestions,
        suggestionState: suggestionState,
        selectedUnit: selectedUnit,
        quantity: quantity,
        disableQuantity: disableQuantity,
        isFractionQuantity: isFractionQuantity,
        price: price,
        p1: p1,
        p2: NullableNumber.dirtyStringPrice(priceText: parseText),
        p3: p3,
        p4: p4,
      );
    } else if (pIndex == 3) {
      return UnitEntryRow(
        name: name,
        unitSuggestions: unitSuggestions,
        suggestionState: suggestionState,
        selectedUnit: selectedUnit,
        quantity: quantity,
        disableQuantity: disableQuantity,
        isFractionQuantity: isFractionQuantity,
        price: price,
        p1: p1,
        p2: p2,
        p3: NullableNumber.dirtyStringPrice(priceText: parseText),
        p4: p4,
      );
    } else if (pIndex == 4) {
      return UnitEntryRow(
        name: name,
        unitSuggestions: unitSuggestions,
        suggestionState: suggestionState,
        selectedUnit: selectedUnit,
        quantity: quantity,
        disableQuantity: disableQuantity,
        isFractionQuantity: isFractionQuantity,
        price: price,
        p1: p1,
        p2: p2,
        p3: p3,
        p4: NullableNumber.dirtyStringPrice(priceText: parseText),
      );
    } else {
      throw IndexError(pIndex, [0, 1, 2, 3, 4]);
    }
  }
}
