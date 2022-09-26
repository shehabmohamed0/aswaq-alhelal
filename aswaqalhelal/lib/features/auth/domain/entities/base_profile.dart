import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/equatable.dart';

import '../../data/models/user/institution_profile_model.dart';
import '../../data/models/user/user_profile_model.dart';
import 'institution_profile.dart';
import 'user_profile.dart';

@immutable
abstract class BaseProfile extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  final String userId;
  final String name;
  final String? photoURL;
  final ProfileType type;
  const BaseProfile({
    required this.id,
    required this.userId,
    required this.name,
    this.photoURL,
    required this.type,
  });
  bool get isEmpty => id.isEmpty;
  bool get isUser => type == ProfileType.user;
  bool get isInstitution => type == ProfileType.institution;
  static const empty = UserProfile(
      id: '', userId: '', name: '', phoneNumber: '', type: ProfileType.user);

  factory BaseProfile.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final type = $enumDecode(_$ProfileTypeEnumMap, document.get('type'));
    switch (type) {
      case ProfileType.user:
        return UserProfileModel.fromFirestore(document);
      case ProfileType.institution:
        return InstitutionProfileModel.fromFirestore(document);
    }
  }
  factory BaseProfile.fromJson(Map<String, dynamic> json) {
    final type = $enumDecode(_$ProfileTypeEnumMap, json['type']);
    switch (type) {
      case ProfileType.user:
        return UserProfileModel.fromJson(json);
      case ProfileType.institution:
        return InstitutionProfileModel.fromJson(json);
    }
  }

  Map<String, dynamic> toJson() {
    final basePofile = this;
    if (basePofile is UserProfile) {
      return (basePofile as UserProfileModel).toJson();
    } else if (basePofile is InstitutionProfile) {
      return (basePofile as InstitutionProfileModel).toJson();
    } else {
      return _toJson();
    }
  }

  Map<String, dynamic> _toJson() => {
        'id': id,
        'userId': userId,
        'name': name,
        'photoURL': photoURL,
        'type': _$ProfileTypeEnumMap[type]
      };
}

enum ProfileType {
  user,
  institution;

  @override
  String toString() {
    switch (this) {
      case ProfileType.user:
        return 'user';
      case ProfileType.institution:
        return 'institution';
    }
  }
}

const _$ProfileTypeEnumMap = {
  ProfileType.user: 'user',
  ProfileType.institution: 'institution',
};
