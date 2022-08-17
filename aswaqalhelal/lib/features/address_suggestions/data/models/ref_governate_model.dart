import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/ref_governate.dart';

part 'ref_governate_model.g.dart';

@JsonSerializable()
class RefGovernateModel extends RefGovernate {
  RefGovernateModel(
      {required String id, required String country, required String name})
      : super(
          id: id,
          country: country,
          name: name,
        );

  factory RefGovernateModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = RefGovernateModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  RefGovernateModel _copyWithId(String id) => RefGovernateModel(
        id: id,
        country: country,
        name: name,
      );
  factory RefGovernateModel.fromJson(Map<String, dynamic> json) =>
      _$RefGovernateModelFromJson(json);

  /// Connect the generated [_$RefGovernateModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RefGovernateModelToJson(this);
}
