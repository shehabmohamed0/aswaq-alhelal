import 'package:aswaqalhelal/features/institution_clients/domain/entities/institution_client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/base_profile.dart';

part 'institution_client_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InstitutionClientModel extends InstitutionClient {
  const InstitutionClientModel({
    required super.id,
    required super.institutionId,
    required super.profile,
  });
  InstitutionClientModel _copyWithId(String id) => InstitutionClientModel(
      id: id, institutionId: institutionId, profile: profile);

  factory InstitutionClientModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = InstitutionClientModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }

  factory InstitutionClientModel.fromJson(Map<String, dynamic> json) =>
      _$InstitutionClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$InstitutionClientModelToJson(this);
}
