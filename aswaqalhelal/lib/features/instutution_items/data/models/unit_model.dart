import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/unit.dart';

part 'unit_model.g.dart';

@JsonSerializable()
class UnitModel extends Unit {
  const UnitModel(
      {required String name, required double quantity, required double price})
      : super(
          name: name,
          quantity: quantity,
          price: price,
        );

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);

  Map<String, dynamic> toJson() => _$UnitModelToJson(this);
}
