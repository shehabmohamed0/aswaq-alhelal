import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/address.dart';
import 'geo_point_model.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressModel extends Address {
  @JsonKey(name: 'geoPoint')
  final GeoPointModel geoPointModel;

  const AddressModel({
    required String id,
    required String country,
    required String governateId,
    required String governate,
    required String cityId,
    required String city,
    required String neighborhoodId,
    required String neighborhood,
    required String description,
    required this.geoPointModel,
  }) : super(
          id: id,
          country: country,
          governateId: governateId,
          governate: governate,
          cityId: cityId,
          city: city,
          neighborhoodId: neighborhoodId,
          neighborhood: neighborhood,
          description: description,
          geoPoint: geoPointModel,
        );

  AddressModel _copyWithId(String id) => AddressModel(
        id: id,
        country: country,
        governateId: governateId,
        governate: governate,
        cityId: cityId,
        city: city,
        neighborhoodId: neighborhoodId,
        neighborhood: neighborhood,
        description: description,
        geoPointModel: geoPointModel,
      );

  factory AddressModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = AddressModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  /// Connect the generated [_$AddressModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

}
