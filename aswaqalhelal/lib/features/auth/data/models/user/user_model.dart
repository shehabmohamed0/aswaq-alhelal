import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel(
      {required String id,
      required String name,
      required String phoneNumber,
      String? email,
      String? photoURL,
      DateTime? birthDate,
      String? gender})
      : super(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            photoURL: photoURL,
            email: email,
            birthDate: birthDate,
            gender: gender);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static const empty = UserModel(id: '', name: '', phoneNumber: '');
  
  UserModel copyWithId(String id) => UserModel(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      birthDate: birthDate,
      email: email,
      gender: gender,
      photoURL: photoURL);
 
  factory UserModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    return _$UserModelFromJson(documentSnapshot.data()!)
        .copyWithId(documentSnapshot.id);
  }
}
