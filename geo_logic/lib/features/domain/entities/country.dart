import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

class Country extends Equatable {
  @JsonKey(name: 'name_en')
  final String enName;
  @JsonKey(name: 'name_ar')
  final String arName;
  @JsonKey()
  final Map<String, Governate> governates;
  const Country({
    required this.enName,
    required this.arName,
    required this.governates,
  });

  @override
  List<Object?> get props => [enName, arName, governates];
}

class Governate extends Equatable {
  @JsonKey(name: 'name_en')
  final String enName;
  @JsonKey(name: 'name_ar')
  final String arName;
  @JsonKey()
  final Map<String, City> cities;

  const Governate({
    required this.enName,
    required this.arName,
    required this.cities,
  });

  @override
  List<Object?> get props => [enName, arName, cities];
}

class City extends Equatable {
  @JsonKey(name: 'name_en')
  final String enName;
  @JsonKey(name: 'name_ar')
  final String arName;
  const City({
    required this.enName,
    required this.arName,
  });

  @override
  List<Object?> get props => [enName, arName];
}
