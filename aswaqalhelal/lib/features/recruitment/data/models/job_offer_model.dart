import 'package:json_annotation/json_annotation.dart';
import 'package:aswaqalhelal/core/json_converters/time_stamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/job_offer.dart';

part 'job_offer_model.g.dart';

@JsonSerializable(converters: [TimestampConverter()])
class JobOfferModel extends JobOffer {
  JobOfferModel({
    required String id,
    required String ownerId,
    required String institutionId,
    String? institutionName,
    required String phoneNumber,
    required String role,
    required OfferState state,
    required DateTime creationTime,
  }) : super(
          id: id,
          ownerId: ownerId,
          institutionId: institutionId,
          institutionName: institutionName,
          phoneNumber: phoneNumber,
          role: role,
          state: state,
          creationTime: creationTime,
        );
  factory JobOfferModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = JobOfferModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  JobOfferModel _copyWithId(String id) => JobOfferModel(
      id: id,
      ownerId: ownerId,
      institutionId: institutionId,
      institutionName: institutionName,
      phoneNumber: phoneNumber,
      role: role,
      state: state,
      creationTime: creationTime);
  factory JobOfferModel.fromJson(Map<String, dynamic> json) =>
      _$JobOfferModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobOfferModelToJson(this);
}
