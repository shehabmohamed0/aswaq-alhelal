// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstitutionModel _$InstitutionModelFromJson(Map<String, dynamic> json) =>
    InstitutionModel(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String,
      officialName: json['officialName'] as String,
      nickName: json['nickName'] as String,
      emails:
          (json['emails'] as List<dynamic>).map((e) => e as String).toList(),
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      addressModel:
          AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      creationTime: const TimestampConverter()
          .fromJson(json['creationTime'] as Timestamp),
    );

Map<String, dynamic> _$InstitutionModelToJson(InstitutionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'officialName': instance.officialName,
      'nickName': instance.nickName,
      'emails': instance.emails,
      'phoneNumbers': instance.phoneNumbers,
      'creationTime': const TimestampConverter().toJson(instance.creationTime),
      'address': instance.addressModel.toJson(),
    };
