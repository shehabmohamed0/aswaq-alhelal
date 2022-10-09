import '../../../features/institution_items/data/models/institution_item_model.dart';
import '../../../features/institution_items/data/models/unit_model.dart';
import '../../../features/orders/data/models/order_item_model.dart';
import '../../../features/orders/data/models/order_model.dart';
import '../../../features/orders/domain/entities/order.dart';
import '../../../features/orders/domain/entities/order_item.dart';

class AddInstitutionReceiptParams {
  final List<OrderItem> receiptItems;
  final double totalPrice;
  final String from;
  final String institutionOwnerId;
  final String? to;
  final String? editorId;
  final String? sellerId;
  AddInstitutionReceiptParams(
      {required this.receiptItems,
      required this.totalPrice,
      required this.from,
      required this.institutionOwnerId,
      required this.to,
      required this.editorId,
      required this.sellerId});

  OrderModel toModel(String id) => OrderModel(
        id: id,
        from: from,
        institutionOwnerId: institutionOwnerId,
        orderState: OrderState.shipping,
        name: 'dasdasd',
        phoneNumber: '+15051',
        itemsModels: receiptItems
            .map(
              (receiptItem) => OrderItemModel(
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
        editorId: editorId,
        sellerId: sellerId,
        creationTime: DateTime.now(),
      );
}
