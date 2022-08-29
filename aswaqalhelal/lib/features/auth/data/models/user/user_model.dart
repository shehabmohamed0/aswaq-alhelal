import 'package:aswaqalhelal/features/address/data/models/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  @JsonKey(name: 'address')
  final AddressModel? addressModel;
  const UserModel({
    required String id,
    required String phoneNumber,
    required String? name,
    String? email,
    String? photoURL,
    DateTime? birthDate,
    String? gender,
    required this.addressModel,
  }) : super(
          id: id,
          name: name,
          phoneNumber: phoneNumber,
          photoURL: photoURL,
          email: email,
          birthDate: birthDate,
          gender: gender,
          address: addressModel,
        );

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static const empty =
      UserModel(id: '', name: '', phoneNumber: '', addressModel: null);

  UserModel copyWithId(String id) => UserModel(
        id: id,
        name: name,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        email: email,
        gender: gender,
        photoURL: photoURL,
        addressModel: addressModel,
      );

  factory UserModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return _$UserModelFromJson(documentSnapshot.data()!)
        .copyWithId(documentSnapshot.id);
  }
}
