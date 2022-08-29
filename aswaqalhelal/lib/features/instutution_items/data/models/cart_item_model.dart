import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/cart_item.dart';
import 'institution_item_model.dart';
import 'unit_model.dart';

part 'cart_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItemModel extends CartItem {
  @JsonKey(name: 'item')
  final InstitutionItemModel itemModel;
  @JsonKey(name: 'selectedUnit')
  final UnitModel selectedUnitModel;
  const CartItemModel({
    required String id,
    required this.itemModel,
    required this.selectedUnitModel,
    required int quantity,
  }) : super(
          id: id,
          item: itemModel,
          selectedUnit: selectedUnitModel,
          quantity: quantity,
        );

  factory CartItemModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = CartItemModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  CartItemModel _copyWithId(String id) => CartItemModel(
      id: id,
      itemModel: itemModel,
      selectedUnitModel: selectedUnitModel,
      quantity: quantity);
  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  /// Connect the generated [_$CartItemModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
