import 'package:aswaqalhelal/features/institution_items/domain/entities/reference_unit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/json_converters/time_stamp_converter.dart';
import 'package:root_package/packages/cloud_firestore.dart';
part 'reference_unit_model.g.dart';

@JsonSerializable(converters: [TimestampConverter()])
class ReferenceUnitModel extends ReferenceUnit {
  const ReferenceUnitModel(
      {required super.id,
      required super.name,
      required super.institutionId,
      required super.creationTime});
  factory ReferenceUnitModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = ReferenceUnitModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  ReferenceUnitModel _copyWithId(String id) => ReferenceUnitModel(
        id: id,
        name: name,
        institutionId: institutionId,
        creationTime: creationTime,
      );
  factory ReferenceUnitModel.fromJson(Map<String, dynamic> json) =>
      _$ReferenceUnitModelFromJson(json);

  /// Connect the generated [_$ReferenceUnitModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReferenceUnitModelToJson(this);
}
