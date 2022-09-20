import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/unit.dart';

part 'unit_model.g.dart';

@JsonSerializable()
class UnitModel extends Unit {
  const UnitModel({
    required String referenceId,
    required String name,
    required double quantity,
    required double price,
  }) : super(
          referenceId: referenceId,
          name: name,
          quantity: quantity,
          price: price,
        );

  factory UnitModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = UnitModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  UnitModel _copyWithId(String id) => UnitModel(
        referenceId: id,
        name: name,
        price: price,
        quantity: quantity,
      );

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);

  Map<String, dynamic> toJson() => _$UnitModelToJson(this);
}