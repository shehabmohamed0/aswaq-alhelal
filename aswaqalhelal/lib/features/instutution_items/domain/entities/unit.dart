import 'package:root_package/packages/equatable.dart';

class Unit extends Equatable {
  final String name;
  final double quantity;
  final double price;

  const Unit({
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  List<Object?> get props => [name, quantity, price];
}
