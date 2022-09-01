import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../../instutution_items/data/models/institution_item_model.dart';
import '../../../instutution_items/data/models/unit_model.dart';
import '../../domain/entities/receipt_item.dart';

part 'receipt_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReceiptItemModel extends ReceiptItem {
  @JsonKey(name: 'item')
  final InstitutionItemModel itemModel;
  @JsonKey(name: 'unit')
  final UnitModel unitModel;
  const ReceiptItemModel({
    required this.itemModel,
    required this.unitModel,
    required int quantity,
    required double price,
  }) : super(
            item: itemModel, unit: unitModel, quantity: quantity, price: price);

  factory ReceiptItemModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = ReceiptItemModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  ReceiptItemModel _copyWithId(String id) => ReceiptItemModel(
        itemModel: itemModel,
        unitModel: unitModel,
        quantity: quantity,
        price: price,
      );
  factory ReceiptItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptItemModelFromJson(json);

  /// Connect the generated [_$ReceiptItemModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReceiptItemModelToJson(this);
}
