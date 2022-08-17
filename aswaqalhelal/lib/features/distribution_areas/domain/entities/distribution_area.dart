import 'package:json_annotation/json_annotation.dart';

class DistributionArea {
  @JsonKey(defaultValue: '')
  final String id;
  final String parentId;
  final String country;
  final String governate;
  final String? city;
  final String? neighborhood;
  const DistributionArea({
    required this.id,
    required this.parentId,
    required this.country,
    required this.governate,
    this.city,
    this.neighborhood,
  });
}
