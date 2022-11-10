// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution_client_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstitutionClientModel _$InstitutionClientModelFromJson(
        Map<String, dynamic> json) =>
    InstitutionClientModel(
      id: json['id'] as String,
      profile: BaseProfile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InstitutionClientModelToJson(
        InstitutionClientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile.toJson(),
    };
