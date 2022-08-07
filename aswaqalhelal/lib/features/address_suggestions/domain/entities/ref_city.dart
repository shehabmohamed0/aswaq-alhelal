import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

class RefCity extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final String country;
  @JsonKey()
  final String governate;
  @JsonKey()
  final String city;

  const RefCity(
      {required this.id,
      required this.country,
      required this.governate,
      required this.city});

  @override
  List<Object?> get props => [id, country, governate, city];
}
