// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobOfferModel _$JobOfferModelFromJson(Map<String, dynamic> json) =>
    JobOfferModel(
      id: json['id'] as String? ?? '',
      ownerId: json['ownerId'] as String,
      institutionId: json['institutionId'] as String,
      institutionName: json['institutionName'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      role: json['role'] as String,
      state: $enumDecode(_$OfferStateEnumMap, json['state']),
      creationTime: const TimestampConverter()
          .fromJson(json['creationTime'] as Timestamp),
    );

Map<String, dynamic> _$JobOfferModelToJson(JobOfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'institutionId': instance.institutionId,
      'institutionName': instance.institutionName,
      'phoneNumber': instance.phoneNumber,
      'role': instance.role,
      'state': _$OfferStateEnumMap[instance.state]!,
      'creationTime': const TimestampConverter().toJson(instance.creationTime),
    };

const _$OfferStateEnumMap = {
  OfferState.pending: 'pending',
  OfferState.accepted: 'accepted',
  OfferState.declined: 'declined',
};
