// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstitutionProfileModel _$InstitutionProfileModelFromJson(
        Map<String, dynamic> json) =>
    InstitutionProfileModel(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String,
      name: json['name'] as String,
      type: $enumDecodeNullable(_$ProfileTypeEnumMap, json['type']) ??
          ProfileType.institution,
      nickName: json['nickName'] as String,
      emails:
          (json['emails'] as List<dynamic>).map((e) => e as String).toList(),
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      creationTime: const TimestampConverter()
          .fromJson(json['creationTime'] as Timestamp),
      addressModel:
          AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InstitutionProfileModelToJson(
        InstitutionProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'type': _$ProfileTypeEnumMap[instance.type]!,
      'nickName': instance.nickName,
      'emails': instance.emails,
      'phoneNumbers': instance.phoneNumbers,
      'creationTime': const TimestampConverter().toJson(instance.creationTime),
      'address': instance.addressModel.toJson(),
    };

const _$ProfileTypeEnumMap = {
  ProfileType.user: 'user',
  ProfileType.institution: 'institution',
  ProfileType.system: 'system',
  ProfileType.nonRegistered: 'nonRegistered',
};
