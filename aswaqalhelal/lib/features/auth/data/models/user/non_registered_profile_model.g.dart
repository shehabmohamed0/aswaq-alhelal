// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'non_registered_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NonRegisteredProfileModel _$NonRegisteredProfileModelFromJson(
        Map<String, dynamic> json) =>
    NonRegisteredProfileModel(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$NonRegisteredProfileModelToJson(
        NonRegisteredProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };
