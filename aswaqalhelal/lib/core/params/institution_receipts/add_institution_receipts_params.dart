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
  final String? name;
  final String? phoneNumber;
  final String? editorId;
  final String? sellerId;
  AddInstitutionReceiptParams({
    required this.receiptItems,
    required this.totalPrice,
    required this.from,
    required this.institutionOwnerId,
    required this.to,
    required this.name,
    required this.phoneNumber,
    required this.editorId,
    required this.sellerId,
  });

  OrderModel toModel(String id, int orderNumber) => OrderModel(
      id: id,
      from: from,
      institutionOwnerId: institutionOwnerId,
      orderState: OrderState.shipping,
      itemsModels: receiptItems.map(OrderItemModel.fromDomain).toList(),
      to: to,
      name: name,
      phoneNumber: phoneNumber,
      totalPrice: totalPrice,
      editorId: editorId,
      sellerId: sellerId,
      creationTime: DateTime.now(),
      orderNumber: orderNumber);
}
