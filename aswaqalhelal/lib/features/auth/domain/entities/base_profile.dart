import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/user/institution_profile_model.dart';
import '../../data/models/user/system_profile_model.dart';
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
      case ProfileType.system:
        return SystemProfileModel.fromFirestore(document);
    }
  }
  factory BaseProfile.fromJson(Map<String, dynamic> json) {
    final type = $enumDecode(_$ProfileTypeEnumMap, json['type']);
    switch (type) {
      case ProfileType.user:
        return UserProfileModel.fromJson(json);
      case ProfileType.institution:
        return InstitutionProfileModel.fromJson(json);
      case ProfileType.system:
        return SystemProfileModel.fromJson(json);
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

  T fold<T>(
    T Function(UserProfile user) onUser,
    T Function(InstitutionProfile institution) onInstitution,
  ) {
    if (this is UserProfile) {
      return onUser(this as UserProfile);
    } else {
      return onInstitution(this as InstitutionProfile);
    }
  }

  UserProfile toUser() {
    if (this is UserProfile) return this as UserProfile;
    throw Exception();
  }
}

enum ProfileType {
  user,
  institution,
  system;

  @override
  String toString() {
    switch (this) {
      case ProfileType.user:
        return 'user';
      case ProfileType.institution:
        return 'institution';
      case ProfileType.system:
        return 'system';
    }
  }
}

const _$ProfileTypeEnumMap = {
  ProfileType.user: 'user',
  ProfileType.institution: 'institution',
  ProfileType.system: 'system',
};
