import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

import 'institution_item.dart';
import 'unit.dart';

class CartItem extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final InstitutionItem item;
  @JsonKey()
  final Unit selectedUnit;
  @JsonKey()
  final int quantity;

  const CartItem({
    required this.id,
    required this.item,
    required this.selectedUnit,
    required this.quantity,
  });

  CartItem copyWith({
    String? id,
    InstitutionItem? item,
    Unit? selectedUnit,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      item: item ?? this.item,
      selectedUnit: selectedUnit ?? this.selectedUnit,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [id, item, selectedUnit, quantity];
}
