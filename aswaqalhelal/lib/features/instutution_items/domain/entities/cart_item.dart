import 'package:root_package/packages/equatable.dart';

import 'institution_item.dart';
import 'unit.dart';

class CartItem extends Equatable {
  final InstitutionItem item;
  final Unit selectedUnit;
  final int quantity;

  const CartItem({
    required this.item,
    required this.selectedUnit,
    required this.quantity,
  });

  @override
  List<Object?> get props => [item, selectedUnit, quantity];
}
