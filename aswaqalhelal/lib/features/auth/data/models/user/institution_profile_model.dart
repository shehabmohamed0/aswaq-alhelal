import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/json_converters/time_stamp_converter.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../../../address/data/models/address_model.dart';
import '../../../domain/entities/base_profile.dart';
import '../../../domain/entities/institution_profile.dart';

part 'institution_profile_model.g.dart';

@JsonSerializable(explicitToJson: true,converters: [TimestampConverter()])
class InstitutionProfileModel extends InstitutionProfile {
 @JsonKey(name: 'address')
  final AddressModel addressModel;
  const InstitutionProfileModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.type,
    required super.nickName,
    required super.emails,
    required super.phoneNumbers,
    required super.creationTime,
    required this.addressModel,
  }) : super(address: addressModel);

  factory InstitutionProfileModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = InstitutionProfileModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  InstitutionProfileModel _copyWithId(String id) => InstitutionProfileModel(
      id: id,
      userId: userId,
      name: name,
      type: type,
      nickName: nickName,
      emails: emails,
      phoneNumbers: phoneNumbers,
      addressModel: addressModel,
      creationTime: creationTime);
  factory InstitutionProfileModel.fromJson(Map<String, dynamic> json) =>
      _$InstitutionProfileModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InstitutionProfileModelToJson(this);
}
