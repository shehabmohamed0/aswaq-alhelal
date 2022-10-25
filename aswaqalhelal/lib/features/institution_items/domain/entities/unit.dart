import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

class Unit extends Equatable {
  @JsonKey()
  final String referenceId;
  final String name;
  final double price;
  final double quantity;
  final Unit? baseUnit;
  final double? p0;
  final double? p1;
  final double? p2;
  final double? p3;
  final double? p4;
  const Unit(
      {required this.referenceId,
      required this.name,
      required this.quantity,
      required this.price,
      required this.p0,
      required this.p1,
      required this.p2,
      required this.p3,
      required this.p4,
      this.baseUnit});
  Unit copyWith({
    String? referenceId,
    String? name,
    double? price,
    double? quantity,
    Unit? baseUnit,
    double? p0,
    double? p1,
    double? p2,
    double? p3,
    double? p4,
  }) {
    return Unit(
      referenceId: referenceId ?? this.referenceId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      baseUnit: baseUnit ?? this.baseUnit,
      p0: p0 ?? this.p0,
      p1: p1 ?? this.p1,
      p2: p2 ?? this.p2,
      p3: p3 ?? this.p3,
      p4: p4 ?? this.p4,
    );
  }

  @override
  List<Object?> get props =>
      [referenceId, name, quantity, price, baseUnit, p0, p1, p2, p3, p4];
}
