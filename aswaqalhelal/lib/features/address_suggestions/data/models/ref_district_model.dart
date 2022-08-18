import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/ref_neighborhood.dart';

part 'ref_district_model.g.dart';

@JsonSerializable()
class RefNeighborhoodModel extends RefNeighborhood {
   RefNeighborhoodModel(
      {required String id,
      required String country,
      required String governate,
      required String city,
      required String name})
      : super(
            id: id,
            country: country,
            governate: governate,
            city: city,
            name: name);

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
      name: name);
  factory RefNeighborhoodModel.fromJson(Map<String, dynamic> json) =>
      _$RefNeighborhoodModelFromJson(json);

  /// Connect the generated [_$RefDistrictModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RefNeighborhoodModelToJson(this);
}
