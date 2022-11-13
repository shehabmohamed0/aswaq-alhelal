import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

class DistributionArea extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  final String institutionId;
  final String parentId;
  final String country;
  final String governate;
  final String? city;
  final String? neighborhood;
  const DistributionArea({
    required this.id,
    required this.institutionId,
    required this.parentId,
    required this.country,
    required this.governate,
    this.city,
    this.neighborhood,
  });

  @override
  List<Object?> get props =>
      [id, institutionId, parentId, country, governate, city, neighborhood];
}
