import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

import '../../../instutution_items/domain/entities/cart_item.dart';

class Receipt extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final String from;
  @JsonKey()
  final String? to;
  @JsonKey()
  final List<CartItem> items;
  @JsonKey()
  final double totalPrice;
  @JsonKey()
  final DateTime creationTime;

  const Receipt({
    required this.id,
    required this.from,
    required this.to,
    required this.items,
    required this.totalPrice,
    required this.creationTime,
  });

  @override
  List<Object?> get props => [id, from, to, items, totalPrice, creationTime];
}
