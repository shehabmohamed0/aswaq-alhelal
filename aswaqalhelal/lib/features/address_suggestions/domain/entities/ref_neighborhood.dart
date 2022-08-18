import 'package:json_annotation/json_annotation.dart';

import 'ref_address.dart';

class RefNeighborhood extends RefAddress {
  @JsonKey()
  final String country;
  @JsonKey()
  final String governate;
  @JsonKey()
  final String city;

  const RefNeighborhood(
      {required String id,
      required this.country,
      required this.governate,
      required this.city,
      required String name})
      : super(id: id, name: name);

  @override
  List<Object?> get props => [id, country, governate, city, name];
}
