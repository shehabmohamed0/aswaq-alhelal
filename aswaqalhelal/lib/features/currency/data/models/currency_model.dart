import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/currency.dart';
part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel extends Currency {
  const CurrencyModel(double amount) : super(amount);
  factory CurrencyModel.fromJson(Map<String, dynamic> json) => _$CurrencyModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
