import 'package:json_annotation/json_annotation.dart';

class JobOffer {
  @JsonKey(defaultValue: '')
  final String id;

  final String ownerId;
  final String institutionId;
  final String? institutionName;
  final String phoneNumber;
  final String role;
  final OfferState state;
  final DateTime creationTime;

  JobOffer({
    required this.id,
    required this.ownerId,
    required this.institutionId,
    required this.institutionName,
    required this.phoneNumber,
    required this.role,
    required this.state,
    required this.creationTime,
  });
}

@JsonEnum()
enum OfferState {
  @JsonValue('pending')
  pending('pending'),
  @JsonValue('accepted')
  accepted('accepted'),
  @JsonValue('declined')
  declined('declined');

  final String message;

  const OfferState(this.message);
}
