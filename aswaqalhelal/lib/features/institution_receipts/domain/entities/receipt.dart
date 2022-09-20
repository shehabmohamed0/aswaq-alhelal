import 'package:aswaqalhelal/features/institution_receipts/domain/entities/receipt_item.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

class Receipt extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final String from;
  @JsonKey()
  final String? to;
  @JsonKey()
  final List<ReceiptItem> items;
  @JsonKey()
  final double totalPrice;
  @JsonKey()
  final DateTime creationTime;
  @JsonKey()
  final String employeeId;

  const Receipt({
    required this.id,
    required this.from,
    required this.to,
    required this.items,
    required this.totalPrice,
    required this.employeeId,
    required this.creationTime,
  });

  @override
  List<Object?> get props =>
      [id, from, to, items, totalPrice, employeeId, creationTime];
}
