import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/unit.dart';

part 'unit_model.g.dart';

@JsonSerializable()
class UnitModel extends Unit {
  @JsonKey(name: 'baseUnit')
  final UnitModel? baseUnitModel;
  const UnitModel(
      {required super.referenceId,
      required super.name,
      required super.quantity,
      required super.price,
      required this.baseUnitModel})
      : super(baseUnit: baseUnitModel);

  factory UnitModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = UnitModel.fromJson(document.data()!);

    return address.copyWith(referenceId: document.id);
  }
  UnitModel copyWith({
    String? referenceId,
    String? name,
    double? price,
    double? quantity,
    UnitModel? baseUnitModel,
  }) =>
      UnitModel(
        referenceId: referenceId ?? this.referenceId,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        baseUnitModel: baseUnitModel ?? this.baseUnitModel,
      );

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);

  Map<String, dynamic> toJson() => _$UnitModelToJson(this);

  factory UnitModel.fromDomain(Unit unit) => UnitModel(
        referenceId: unit.referenceId,
        name: unit.name,
        quantity: unit.quantity,
        price: unit.price,
        baseUnitModel:
            unit.baseUnit == null ? null : UnitModel.fromDomain(unit.baseUnit!),
      );
}
