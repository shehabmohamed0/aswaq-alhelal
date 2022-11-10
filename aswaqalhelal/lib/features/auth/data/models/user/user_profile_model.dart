import 'package:aswaqalhelal/features/address/data/models/address_model.dart';
import 'package:aswaqalhelal/features/auth/domain/entities/base_profile.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../../domain/entities/user_profile.dart';
part 'user_profile_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfileModel extends UserProfile {
  @JsonKey(name: 'address')
  final AddressModel? addressModel;
  const UserProfileModel(
      {required super.id,
      required super.userId,
      required super.name,
      required super.type,
      required super.phoneNumber,
      super.email,
      super.photoURL,
      super.gender,
      super.birthDate,
      this.addressModel})
      : super(address: addressModel);

  factory UserProfileModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = UserProfileModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  UserProfileModel _copyWithId(String id) => UserProfileModel(
        id: id,
        userId: userId,
        name: name,
        type: type,
        phoneNumber: phoneNumber,
        email: email,
        photoURL: photoURL,
        gender: gender,
        addressModel: addressModel,
        birthDate: birthDate,
      );
  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}


/*

 */