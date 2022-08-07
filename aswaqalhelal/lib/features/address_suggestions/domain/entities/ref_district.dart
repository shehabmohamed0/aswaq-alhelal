import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

class RefNeighborhood extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final String country;
  @JsonKey()
  final String governate;
  @JsonKey()
  final String city;
  @JsonKey()
  final String neighborhood;

  const RefNeighborhood(
      {required this.id,
      required this.country,
      required this.governate,
      required this.city,
      required this.neighborhood});

  @override
  List<Object?> get props => [id, country, governate, city, neighborhood];
}
