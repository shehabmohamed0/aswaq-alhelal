import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/freezed_annotation.dart';

import '../../../domain/entities/base_profile.dart';
import '../../../domain/entities/system_profile.dart';
part 'system_profile_model.g.dart';
@JsonSerializable()
class SystemProfileModel extends SystemProfile {
  const SystemProfileModel({
    required super.id,
    required super.userId,
    required super.arabicName,
    required super.name,
    required super.type,
  });
  factory SystemProfileModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = SystemProfileModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  SystemProfileModel _copyWithId(String id) => SystemProfileModel(
        id: id,
        userId: userId,
        arabicName: arabicName,
        name: name,
        type: type,
      );
  factory SystemProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SystemProfileModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SystemProfileModelToJson(this);
}
