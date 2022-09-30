import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:root_package/packages/equatable.dart';

import '../../../institution_items/domain/entities/institution_item.dart';
import '../../../institution_items/domain/entities/unit.dart';

class OrderItem extends Equatable {
  final InstitutionItem item;
  final Unit unit;
  final int quantity;
  final double price;

  const OrderItem({
    required this.item,
    required this.unit,
    required this.quantity,
    required this.price,
  });

  OrderItem copyWith({
    InstitutionItem? item,
    Unit? unit,
    int? quantity,
    double? price,
  }) {
    return OrderItem(
      item: item ?? this.item,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  List<Object> get props => [item, unit, quantity, price];
}
