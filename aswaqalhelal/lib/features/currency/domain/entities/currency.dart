import 'package:root_package/packages/json_annotation.dart';
import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  const Currency([this.amount = 0]);
  @JsonKey(name: 'result')
  final double amount;

  @override
  List<Object?> get props => [amount];
}
