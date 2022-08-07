import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/ref_district.dart';

part 'ref_district_model.g.dart';

@JsonSerializable()
class RefNeighborhoodModel extends RefNeighborhood {
  const RefNeighborhoodModel(
      {required String id,
      required String country,
      required String governate,
      required String city,
      required String neighborhood})
      : super(
            id: id,
            country: country,
            governate: governate,
            city: city,
            neighborhood: neighborhood);

  factory RefNeighborhoodModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = RefNeighborhoodModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  RefNeighborhoodModel _copyWithId(String id) => RefNeighborhoodModel(
      id: id,
      country: country,
      governate: governate,
      city: city,
      neighborhood: neighborhood);
  factory RefNeighborhoodModel.fromJson(Map<String, dynamic> json) =>
      _$RefNeighborhoodModelFromJson(json);

  /// Connect the generated [_$RefDistrictModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RefNeighborhoodModelToJson(this);
}