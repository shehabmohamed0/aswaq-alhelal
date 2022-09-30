import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../../institution_items/data/models/institution_item_model.dart';
import '../../../institution_items/data/models/unit_model.dart';
import '../../domain/entities/order_item.dart';

part 'order_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderItemModel extends OrderItem {
  @JsonKey(name: 'item')
  final InstitutionItemModel itemModel;
  @JsonKey(name: 'unit')
  final UnitModel unitModel;
  const OrderItemModel({
    required this.itemModel,
    required this.unitModel,
    required int quantity,
    required double price,
  }) : super(
            item: itemModel, unit: unitModel, quantity: quantity, price: price);

  factory OrderItemModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = OrderItemModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  OrderItemModel _copyWithId(String id) => OrderItemModel(
        itemModel: itemModel,
        unitModel: unitModel,
        quantity: quantity,
        price: price,
      );
  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  /// Connect the generated [_$ReceiptItemModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);

  factory OrderItemModel.fromDomain(OrderItem receiptItem) =>
      OrderItemModel(
          itemModel: InstitutionItemModel.fromDomain(receiptItem.item),
          unitModel: UnitModel.fromDomain(receiptItem.unit),
          quantity: receiptItem.quantity,
          price: receiptItem.price);
}
