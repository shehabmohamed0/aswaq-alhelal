import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/institution.dart';

part 'institution_model.g.dart';

@JsonSerializable()
class InstitutionModel extends Institution {
  const InstitutionModel(
      {required String id,
      required String userId,
      required String officialName,
      required String commercialName,
      required String brandName,
      required String nickname,
      required List<String> emails,
      required List<String> phoneNumbers})
      : super(
            id: id,
            userId: userId,
            officialName: officialName,
            commercialName: commercialName,
            brandName: brandName,
            nickname: nickname,
            emails: emails,
            phoneNumbers: phoneNumbers);

  factory InstitutionModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = InstitutionModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  InstitutionModel _copyWithId(String id) => InstitutionModel(
      id: id,
      userId: userId,
      officialName: officialName,
      commercialName: commercialName,
      brandName: brandName,
      nickname: nickname,
      emails: emails,
      phoneNumbers: phoneNumbers);
  factory InstitutionModel.fromJson(Map<String, dynamic> json) =>
      _$InstitutionModelFromJson(json);

  /// Connect the generated [_$InstitutionModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$InstitutionModelToJson(this);
}
