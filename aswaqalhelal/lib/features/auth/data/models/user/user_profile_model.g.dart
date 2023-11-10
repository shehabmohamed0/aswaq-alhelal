// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String,
      name: json['name'] as String? ?? '',
      type: $enumDecodeNullable(_$ProfileTypeEnumMap, json['type']) ??
          ProfileType.user,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String?,
      photoURL: json['photoURL'] as String?,
      gender: json['gender'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      addressModel: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'photoURL': instance.photoURL,
      'type': _$ProfileTypeEnumMap[instance.type]!,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'birthDate': instance.birthDate?.toIso8601String(),
      'gender': instance.gender,
      'address': instance.addressModel?.toJson(),
    };

const _$ProfileTypeEnumMap = {
  ProfileType.user: 'user',
  ProfileType.institution: 'institution',
  ProfileType.system: 'system',
  ProfileType.nonRegistered: 'nonRegistered',
};
