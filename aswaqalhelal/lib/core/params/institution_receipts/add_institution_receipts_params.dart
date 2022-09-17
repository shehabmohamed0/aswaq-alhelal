import 'package:aswaqalhelal/features/institution_receipts/data/models/receipt_item_model.dart';
import 'package:aswaqalhelal/features/institution_items/data/models/institution_item_model.dart';
import 'package:aswaqalhelal/features/institution_items/data/models/unit_model.dart';

import '../../../features/institution_receipts/data/models/receipt_model.dart';
import '../../../features/institution_receipts/domain/entities/receipt_item.dart';

class AddInstitutionReceiptParams {
  final List<ReceiptItem> receiptItems;
  final double totalPrice;
  final String from;
  final String? to;

  AddInstitutionReceiptParams({
    required this.receiptItems,
    required this.totalPrice,
    required this.from,
    required this.to,
  });

  ReceiptModel toModel(String id) => ReceiptModel(
        id: id,
        from: from,
        itemsModels: receiptItems
            .map(
              (receiptItem) => ReceiptItemModel(
                  itemModel: InstitutionItemModel(
                    id: receiptItem.item.id,
                    name: receiptItem.item.name,
                    institutionId: receiptItem.item.institutionId,
                    referenceId: receiptItem.item.referenceId,
                    imageUrl: receiptItem.item.imageUrl,
                    unitModels: receiptItem.item.units
                        .map((unit) => UnitModel(
                            referenceId: unit.referenceId,
                            name: unit.name,
                            quantity: unit.quantity,
                            price: unit.price))
                        .toList(),
                    creationTime: receiptItem.item.creationTime,
                  ),
                  price: receiptItem.price,
                  quantity: receiptItem.quantity,
                  unitModel: UnitModel(
                    referenceId: receiptItem.unit.referenceId,
                    name: receiptItem.unit.name,
                    price: receiptItem.unit.price,
                    quantity: receiptItem.unit.quantity,
                  )),
            )
            .toList(),
        to: to,
        totalPrice: totalPrice,
        creationTime: DateTime.now(),
      );
}
