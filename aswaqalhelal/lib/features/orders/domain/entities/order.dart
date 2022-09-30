import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

import 'order_item.dart';

class Order extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  final String? from;
  final String to;
  final List<OrderItem> items;
  final double totalPrice;
  final DateTime creationTime;
  // The person holding mobile
  final String? editorId;
  final String? sellerId;
  final String? distributorId;
  final String? collectorId;
  final OrderState orderState;
  const Order({
    required this.id,
    required this.from,
    required this.to,
    required this.items,
    required this.totalPrice,
    required this.editorId,
    required this.sellerId,
    required this.distributorId,
    required this.collectorId,
    required this.orderState,
    required this.creationTime,
  });

  @override
  List<Object?> get props => [
        id,
        from,
        to,
        items,
        totalPrice,
        editorId,
        sellerId,
        distributorId,
        collectorId,
        orderState,
        creationTime
      ];
}

enum OrderState {
  pending,
  processing,
  shipping,
  completed;

  @override
  String toString() {
    switch (this) {
      case OrderState.pending:
        return 'pending';
      case OrderState.processing:
        return 'processing';
      case OrderState.shipping:
        return 'shipping';
      case OrderState.completed:
        return 'completed';
    }
  }
}
