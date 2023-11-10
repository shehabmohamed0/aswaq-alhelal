import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/models/user/institution_profile_model.dart';
import '../../data/models/user/non_registered_profile_model.dart';
import '../../data/models/user/system_profile_model.dart';
import '../../data/models/user/user_profile_model.dart';
import 'institution_profile.dart';
import 'non_registered_profile.dart';
import 'system_profile.dart';
import 'user_profile.dart';

@immutable
abstract class BaseProfile extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  final String userId;
  @JsonKey(defaultValue: '')
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
    id: '',
    userId: '',
    name: '',
    phoneNumber: '',
    type: ProfileType.user,
  );

  factory BaseProfile.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final type = $enumDecode(_$ProfileTypeEnumMap, document.get('type'));
    switch (type) {
      case ProfileType.user:
        return UserProfileModel.fromFirestore(document);
      case ProfileType.institution:
        return InstitutionProfileModel.fromFirestore(document);
      case ProfileType.nonRegistered:
        return NonRegisteredProfileModel.fromFirestore(document);
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
      case ProfileType.nonRegistered:
        return NonRegisteredProfileModel.fromJson(json);
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

  T mapOrException<T>(
    T Function(UserProfile profile)? userProfile,
    T Function(InstitutionProfile institutionProfile)? institutionProfile,
    T Function(NonRegisteredProfile profile)? nonRegisteredProfile,
    T Function(SystemProfile profile)? systemProfile,
  ) {
    T? result;

    if (this is UserProfile) {
      result = userProfile?.call(this as UserProfile);
    } else if (this is InstitutionProfile) {
      result = institutionProfile?.call(this as InstitutionProfile);
    } else if (this is InstitutionProfile) {
      result = systemProfile?.call(this as SystemProfile);
    } else if (this is InstitutionProfile) {
      result = nonRegisteredProfile?.call(this as NonRegisteredProfile);
    }
    return result!;
  }

  UserProfile toUser() {
    if (this is UserProfile) return this as UserProfile;
    throw Exception();
  }

  T mapOrElse<T>({
    T Function(UserProfile profile)? userProfile,
    T Function(InstitutionProfile profile)? institutionProfile,
    T Function(SystemProfile profile)? systemProfile,
    T Function(NonRegisteredProfile profile)? nonRegisteredProfile,
    required T Function() orElse,
  }) {
    T? result;

    if (this is UserProfile) {
      result = userProfile?.call(this as UserProfile);
    } else if (this is InstitutionProfile) {
      result = institutionProfile?.call(this as InstitutionProfile);
    } else if (this is InstitutionProfile) {
      result = systemProfile?.call(this as SystemProfile);
    } else if (this is InstitutionProfile) {
      result = nonRegisteredProfile?.call(this as NonRegisteredProfile);
    }
    return result ?? orElse();
  }

  T? mapOrNull<T>({
    T Function(UserProfile profile)? userProfile,
    T Function(InstitutionProfile profile)? institutionProfile,
    T Function(SystemProfile profile)? systemProfile,
    T Function(NonRegisteredProfile profile)? nonRegisteredProfile,
  }) {
    T? result;

    if (this is UserProfile) {
      result = userProfile?.call(this as UserProfile);
    } else if (this is InstitutionProfile) {
      result = institutionProfile?.call(this as InstitutionProfile);
    } else if (this is InstitutionProfile) {
      result = systemProfile?.call(this as SystemProfile);
    } else if (this is InstitutionProfile) {
      result = nonRegisteredProfile?.call(this as NonRegisteredProfile);
    }
    return result;
  }
}

enum ProfileType {
  user,
  institution,
  system,
  nonRegistered;

  @override
  String toString() {
    switch (this) {
      case ProfileType.user:
        return 'user';
      case ProfileType.institution:
        return 'institution';
      case ProfileType.system:
        return 'system';
      case ProfileType.nonRegistered:
        return 'nonRegistered';
    }
  }
}

const _$ProfileTypeEnumMap = {
  ProfileType.user: 'user',
  ProfileType.institution: 'institution',
  ProfileType.nonRegistered: 'nonRegistered',
  ProfileType.system: 'system',
};
