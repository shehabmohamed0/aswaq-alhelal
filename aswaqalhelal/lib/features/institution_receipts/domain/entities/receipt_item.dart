import 'package:aswaqalhelal/features/instutution_items/domain/entities/institution_item.dart';
import 'package:aswaqalhelal/features/instutution_items/domain/entities/unit.dart';
import 'package:root_package/packages/equatable.dart';

class ReceiptItem extends Equatable {
  final InstitutionItem item;
  final Unit selectedUnit;
  final int quantity;
  final double selectedPrice;

  const ReceiptItem({
    required this.item,
    required this.selectedUnit,
    required this.quantity,
    required this.selectedPrice,
  });

  @override
  List<Object?> get props => [item, selectedUnit, quantity, selectedPrice];
}
