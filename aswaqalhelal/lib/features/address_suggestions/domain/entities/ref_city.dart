import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

import 'ref_address.dart';

class RefCity extends RefAddress {
  @JsonKey()
  final String country;
  @JsonKey()
  final String governate;

  RefCity({
    required String id,
    required this.country,
    required this.governate,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  @override
  List<Object?> get props => [id, country, governate, name];
}
