import 'package:aswaqalhelal/features/instutution_items/domain/entities/institution_item.dart';
import 'package:aswaqalhelal/features/instutution_items/domain/entities/unit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

class ReceiptItem extends Equatable {
  final InstitutionItem item;
  final Unit unit;
  @JsonKey()
  final int quantity;
  @JsonKey()
  final double price;

  const ReceiptItem({
    required this.item,
    required this.unit,
    required this.quantity,
    required this.price,
  });

  @override
  List<Object?> get props => [item, unit, quantity, price];
}
