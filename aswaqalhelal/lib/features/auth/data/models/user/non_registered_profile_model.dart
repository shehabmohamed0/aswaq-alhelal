import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/base_profile.dart';
import '../../../domain/entities/non_registered_profile.dart';

part 'non_registered_profile_model.g.dart';

@JsonSerializable()
class NonRegisteredProfileModel extends NonRegisteredProfile {
  const NonRegisteredProfileModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.phoneNumber,
    super.type = ProfileType.nonRegistered,
  });

  factory NonRegisteredProfileModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = NonRegisteredProfileModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  NonRegisteredProfileModel _copyWithId(String id) => NonRegisteredProfileModel(
        id: id,
        userId: userId,
        name: name,
        phoneNumber: phoneNumber,
        type: type,
      );
  factory NonRegisteredProfileModel.fromJson(Map<String, dynamic> json) =>
      _$NonRegisteredProfileModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NonRegisteredProfileModelToJson(this);
}
