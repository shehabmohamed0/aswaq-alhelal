import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

class Unit extends Equatable {
  @JsonKey()
  final String referenceId;
  final String name;
  final double quantity;
  final double price;

  const Unit({
    required this.referenceId,
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  List<Object?> get props => [referenceId, name, quantity, price];
}
