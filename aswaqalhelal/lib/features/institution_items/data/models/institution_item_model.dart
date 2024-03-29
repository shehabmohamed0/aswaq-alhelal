import 'package:json_annotation/json_annotation.dart';
import 'package:aswaqalhelal/core/json_converters/time_stamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/institution_item.dart';
import 'unit_model.dart';

part 'institution_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InstitutionItemModel extends InstitutionItem {
  @JsonKey(name: 'units')
  final List<UnitModel> unitModels;
  const InstitutionItemModel({
    required String id,
    required String institutionId,
    required String referenceId,
    required String name,
    required String? imageUrl,
    required DateTime creationTime,
    required this.unitModels,
  }) : super(
            id: id,
            name: name,
            institutionId: institutionId,
            imageUrl: imageUrl,
            referenceId: referenceId,
            units: unitModels,
            creationTime: creationTime);

  factory InstitutionItemModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = InstitutionItemModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  InstitutionItemModel _copyWithId(String id) => InstitutionItemModel(
      id: id,
      name: name,
      imageUrl: imageUrl,
      institutionId: institutionId,
      referenceId: referenceId,
      unitModels: unitModels,
      creationTime: creationTime);
  factory InstitutionItemModel.fromJson(Map<String, dynamic> json) =>
      _$InstitutionItemModelFromJson(json);

  /// Connect the generated [_$InstitutionItemModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$InstitutionItemModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        institutionId,
        referenceId,
        units,
        creationTime,
        unitModels,
      ];

  factory InstitutionItemModel.fromDomain(InstitutionItem item) =>
      InstitutionItemModel(
          id: item.id,
          institutionId: item.institutionId,
          referenceId: item.referenceId,
          name: item.name,
          imageUrl: item.imageUrl,
          creationTime: item.creationTime,
          unitModels: item.units.map(UnitModel.fromDomain).toList());
}
