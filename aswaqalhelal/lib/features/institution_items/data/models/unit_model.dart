import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/unit.dart';

part 'unit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UnitModel extends Unit {
  @JsonKey(name: 'baseUnit')
  final UnitModel? baseUnitModel;
  const UnitModel({
    required super.referenceId,
    required super.name,
    required super.quantity,
    required super.price,
    required super.p0,
    required super.p1,
    required super.p2,
    required super.p3,
    required super.p4,
    required this.baseUnitModel,
  }) : super(baseUnit: baseUnitModel);

  factory UnitModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final unitModel = UnitModel.fromJson(document.data()!);

    return unitModel.copyWith2(referenceId: document.id);
  }
  UnitModel copyWith2({
    String? referenceId,
    String? name,
    double? price,
    double? quantity,
    double? p0,
    double? p1,
    double? p2,
    double? p3,
    double? p4,
    UnitModel? baseUnitModel,
  }) =>
      UnitModel(
        referenceId: referenceId ?? this.referenceId,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        baseUnitModel: baseUnitModel ?? this.baseUnitModel,
        p0: p0 ?? this.p0,
        p1: p1 ?? this.p1,
        p2: p2 ?? this.p2,
        p3: p3 ?? this.p3,
        p4: p4 ?? this.p4,
      );

  factory UnitModel.fromJson(Map<String, dynamic> json) =>
      _$UnitModelFromJson(json);

  Map<String, dynamic> toJson() => _$UnitModelToJson(this);

  factory UnitModel.fromDomain(Unit unit) => UnitModel(
        referenceId: unit.referenceId,
        name: unit.name,
        quantity: unit.quantity,
        price: unit.price,
        p0: unit.p0,
        p1: unit.p1,
        p2: unit.p2,
        p3: unit.p3,
        p4: unit.p4,
        baseUnitModel:
            unit.baseUnit == null ? null : UnitModel.fromDomain(unit.baseUnit!),
      );
}
