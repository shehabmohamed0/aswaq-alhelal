import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/json_converters/time_stamp_converter.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/reference_item.dart';
import 'unit_model.dart';

part 'reference_item_model.g.dart';

@JsonSerializable()
class ReferenceItemModel extends ReferenceItem {
  @JsonKey(name: 'units')
  final List<UnitModel> unitModels;
  const ReferenceItemModel({
    required String id,
    required String institutionId,
    required String name,
    required DateTime creationTime,
    required this.unitModels,
  }) : super(
          id: id,
          name: name,
          institutionId: institutionId,
          units: unitModels,
          creationTime: creationTime,
        );

  factory ReferenceItemModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = ReferenceItemModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  ReferenceItemModel _copyWithId(String id) => ReferenceItemModel(
        id: id,
        name: name,
        institutionId: institutionId,
        unitModels: unitModels,
        creationTime: creationTime,
      );
  factory ReferenceItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReferenceItemModelFromJson(json);

  /// Connect the generated [_$ReferenceItemModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReferenceItemModelToJson(this);
  @override
  List<Object?> get props => [
        id,
        name,
        institutionId,
        units,
        creationTime,
        unitModels,
      ];
}
