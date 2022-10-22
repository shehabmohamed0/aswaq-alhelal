import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

class Unit extends Equatable {
  @JsonKey()
  final String referenceId;
  final String name;
  final double price;
  final double quantity;
  final Unit? baseUnit;
  const Unit(
      {required this.referenceId,
      required this.name,
      required this.quantity,
      required this.price,
      this.baseUnit});
  Unit copyWith({
    String? referenceId,
    String? name,
    double? price,
    double? quantity,
    Unit? baseUnit,
  }) {
    return Unit(
      referenceId: referenceId ?? this.referenceId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      baseUnit: baseUnit ?? this.baseUnit,
    );
  }

  @override
  List<Object?> get props => [referenceId, name, quantity, price, baseUnit];
}
