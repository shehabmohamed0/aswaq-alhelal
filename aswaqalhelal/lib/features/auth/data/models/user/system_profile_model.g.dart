// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemProfileModel _$SystemProfileModelFromJson(Map<String, dynamic> json) =>
    SystemProfileModel(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String,
      arabicName: json['arabicName'] as String,
      name: json['name'] as String,
      type: $enumDecodeNullable(_$ProfileTypeEnumMap, json['type']) ??
          ProfileType.system,
    );

Map<String, dynamic> _$SystemProfileModelToJson(SystemProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'type': _$ProfileTypeEnumMap[instance.type]!,
      'arabicName': instance.arabicName,
    };

const _$ProfileTypeEnumMap = {
  ProfileType.user: 'user',
  ProfileType.institution: 'institution',
  ProfileType.system: 'system',
  ProfileType.nonRegistered: 'nonRegistered',
};
