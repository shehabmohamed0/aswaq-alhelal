import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'order_item.dart';

class Order extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  final String from;
  final String institutionOwnerId;
  final String? to;
  final String? name;
  final String? phoneNumber;
  final List<OrderItem> items;
  final double totalPrice;
  final DateTime creationTime;
  // The person holding mobile
  final String? editorId;
  final String? sellerId;
  final String? distributorId;
  final String? collectorId;
  final OrderState orderState;
  @JsonKey(defaultValue: 0)
  final int orderNumber;
  const Order({
    required this.id,
    required this.from,
    required this.to,
    required this.institutionOwnerId,
    required this.name,
    required this.phoneNumber,
    required this.items,
    required this.totalPrice,
    required this.editorId,
    required this.sellerId,
    required this.distributorId,
    required this.collectorId,
    required this.orderState,
    required this.creationTime,
    required this.orderNumber,
  });

  @override
  List<Object?> get props => [
        id,
        from,
        institutionOwnerId,
        to,
        name,
        phoneNumber,
        items,
        totalPrice,
        editorId,
        sellerId,
        distributorId,
        collectorId,
        orderState,
        creationTime,
        orderNumber
      ];
}

enum OrderState {
  pending,
  processing,
  shipping,
  completed,
  declined,
  //canceled by user
  canceled;

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
      case OrderState.declined:
        return 'declined';
      case OrderState.canceled:
        return 'canceled';
    }
  }

  bool get isPending => this == pending;
  bool get isProcessing => this == processing;
  bool get isShipping => this == shipping;
  bool get isCompleted => this == completed;
  bool get isDeclined => this == declined;
  bool get isCanceled => this == canceled;
}
