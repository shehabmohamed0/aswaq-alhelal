import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/ref_city.dart';

part 'ref_city_model.g.dart';

@JsonSerializable()
class RefCityModel extends RefCity {
   const RefCityModel(
      {required String id,
      required String country,
      required String governate,
      required String name})
      : super(
          id: id,
          country: country,
          governate: governate,
          name: name,
        );

  factory RefCityModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = RefCityModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  RefCityModel _copyWithId(String id) => RefCityModel(
        id: id,
        country: country,
        governate: governate,
        name: name,
      );
  factory RefCityModel.fromJson(Map<String, dynamic> json) =>
      _$RefCityModelFromJson(json);

  /// Connect the generated [_$RefCityModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RefCityModelToJson(this);
}
