import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/json_converters/time_stamp_converter.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../../instutution_items/data/models/cart_item_model.dart';
import '../../domain/entities/receipt.dart';
part 'receipt_model.g.dart';

@JsonSerializable(explicitToJson: true, converters: [TimestampConverter()])
class ReceiptModel extends Receipt {
  @JsonKey(name: 'items')
  final List<CartItemModel> itemsModels;
  const ReceiptModel({
    required String id,
    required String from,
    required String? to,
    required this.itemsModels,
    required double totalPrice,
    required DateTime creationTime,
  }) : super(
          id: id,
          from: from,
          to: to,
          items: itemsModels,
          totalPrice: totalPrice,
          creationTime: creationTime,
        );

  factory ReceiptModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = ReceiptModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  ReceiptModel _copyWithId(String id) => ReceiptModel(
        id: id,
        from: from,
        itemsModels: itemsModels,
        to: to,
        totalPrice: totalPrice,
        creationTime: creationTime,
      );
  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);

  /// Connect the generated [_$ReceiptModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReceiptModelToJson(this);
}
