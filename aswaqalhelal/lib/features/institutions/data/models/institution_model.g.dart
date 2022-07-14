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
      commercialName: json['commercialName'] as String,
      brandName: json['brandName'] as String,
      nickname: json['nickname'] as String,
      emails:
          (json['emails'] as List<dynamic>).map((e) => e as String).toList(),
      phoneNumbers: (json['phoneNumbers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InstitutionModelToJson(InstitutionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'officialName': instance.officialName,
      'commercialName': instance.commercialName,
      'brandName': instance.brandName,
      'nickname': instance.nickname,
      'emails': instance.emails,
      'phoneNumbers': instance.phoneNumbers,
    };
