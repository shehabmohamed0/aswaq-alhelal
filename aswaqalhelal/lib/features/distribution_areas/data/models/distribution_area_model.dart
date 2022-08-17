import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/distribution_area.dart';

part 'distribution_area_model.g.dart';

@JsonSerializable()
class DistributionAreaModel extends DistributionArea {
  DistributionAreaModel({
    required String id,
    required String parentId,
    required String country,
    required String governate,
    String? city,
    String? neighborhood,
  }) : super(
          id: id,
          parentId: parentId,
          country: country,
          governate: governate,
          city: city,
          neighborhood: neighborhood,
        );

  factory DistributionAreaModel.fromMapEntry(
      MapEntry<String, dynamic> mapEntry) {
    final distributionArea = DistributionAreaModel.fromJson(mapEntry.value);

    return distributionArea._copyWithId(mapEntry.key);
  }
  DistributionAreaModel _copyWithId(String id) => DistributionAreaModel(
        id: id,
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
