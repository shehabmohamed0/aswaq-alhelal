import 'package:json_annotation/json_annotation.dart';

import 'ref_address.dart';

class RefGovernate extends RefAddress {
  @JsonKey()
  final String country;

  const RefGovernate({
    required String id,
    required this.country,
    required String name,
  }) : super(id: id, name: name);

  @override
  List<Object?> get props => [id, country, name];
}
