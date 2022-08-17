import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/json_converters/time_stamp_converter.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../../address/data/models/address_model.dart';
import '../../domain/entities/institution.dart';

part 'institution_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InstitutionModel extends Institution {
  @JsonKey(name: 'address')
  final AddressModel addressModel;
  const InstitutionModel(
      {required String id,
      required String userId,
      required String officialName,
      required String nickName,
      required List<String> emails,
      required List<String> phoneNumbers,
      required this.addressModel,
      required DateTime creationTime})
      : super(
            id: id,
            userId: userId,
            officialName: officialName,
            nickName: nickName,
            emails: emails,
            phoneNumbers: phoneNumbers,
            address: addressModel,
            creationTime: creationTime);

  factory InstitutionModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = InstitutionModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  InstitutionModel _copyWithId(String id) => InstitutionModel(
      id: id,
      userId: userId,
      officialName: officialName,
      nickName: nickName,
      emails: emails,
      phoneNumbers: phoneNumbers,
      addressModel: addressModel,
      creationTime: creationTime);
  factory InstitutionModel.fromJson(Map<String, dynamic> json) =>
      _$InstitutionModelFromJson(json);

  /// Connect the generated [_$InstitutionModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$InstitutionModelToJson(this);
}
