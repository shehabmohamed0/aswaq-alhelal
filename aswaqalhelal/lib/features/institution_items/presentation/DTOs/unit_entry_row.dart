import 'package:flutter/cupertino.dart';
import 'package:root_package/core/form_inputs/name.dart';
import 'package:root_package/core/form_inputs/number.dart';
import 'package:root_package/core/form_inputs/required_object.dart';
import 'package:root_package/packages/equatable.dart';

import '../../domain/entities/unit.dart';
import '../pages/add_item/widgets/auto_suggest_text_field.dart';

@immutable
class UnitEntryRow extends Equatable {
  final Name name;
  final List<Unit> unitSuggestions;
  final AutoSuggestionState suggestionState;
  final RequiredObject<Unit> selectedUnit;
  final RequiredObject<Unit> baseUnit;
  final Number quantity;
  final Number price;
  const UnitEntryRow({
    required this.name,
    required this.unitSuggestions,
    required this.suggestionState,
    required this.selectedUnit,
    required this.baseUnit,
    required this.quantity,
    required this.price,
  });

  UnitEntryRow copyWith({
    Name? name,
    List<Unit>? unitSuggestions,
    AutoSuggestionState? suggestionState,
    RequiredObject<Unit>? selectedUnit,
    RequiredObject<Unit>? baseUnit,
    Number? quantity,
    Number? price,
  }) {
    return UnitEntryRow(
      name: name ?? this.name,
      unitSuggestions: unitSuggestions ?? this.unitSuggestions,
      suggestionState: suggestionState ?? this.suggestionState,
      selectedUnit: selectedUnit ?? this.selectedUnit,
      baseUnit: baseUnit ?? this.baseUnit,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [
        name,
        unitSuggestions,
        suggestionState,
        selectedUnit,
        baseUnit,
        quantity,
        price
      ];
}
