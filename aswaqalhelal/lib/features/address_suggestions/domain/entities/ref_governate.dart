import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

class RefGovernate extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final String country;
  @JsonKey()
  final String governate;

  const RefGovernate({
    required this.id,
    required this.country,
    required this.governate,
  });

  @override
  List<Object?> get props => [id, country, governate];
}
