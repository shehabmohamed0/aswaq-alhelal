import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/distribution_area.dart';

part 'distribution_area_model.g.dart';

@JsonSerializable()
class DistributionAreaModel extends DistributionArea {
  const DistributionAreaModel({
    required String id,
    required String institutionId,
    required String parentId,
    required String country,
    required String governate,
    String? city,
    String? neighborhood,
  }) : super(
          id: id,
          institutionId: institutionId,
          parentId: parentId,
          country: country,
          governate: governate,
          city: city,
          neighborhood: neighborhood,
        );

  factory DistributionAreaModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> document) {
    final distributionArea = DistributionAreaModel.fromJson(document.data());

    return distributionArea._copyWithId(document.id);
  }
  DistributionAreaModel _copyWithId(String id) => DistributionAreaModel(
        id: id,
        institutionId: institutionId,
        parentId: parentId,
        country: country,
        governate: governate,
        city: city,
        neighborhood: neighborhood,
      );

  factory DistributionAreaModel.fromJson(Map<String, dynamic> json) =>
      _$DistributionAreaModelFromJson(json);

  /// Connect the generated [_$DistributionAreaModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DistributionAreaModelToJson(this);
}
