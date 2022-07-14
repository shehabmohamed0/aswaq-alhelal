import 'package:json_annotation/json_annotation.dart';

class Country {
  @JsonKey(name: 'name_en')
  final String enName;
  @JsonKey(name: 'name_ar')
  final String arName;
  @JsonKey()
  final Map<String, Governate> governates;
  Country({
    required this.enName,
    required this.arName,
    required this.governates,
  });
}

class Governate {
  @JsonKey(name: 'name_en')
  final String enName;
  @JsonKey(name: 'name_ar')
  final String arName;
  @JsonKey()
  final Map<String,City> cities;

  Governate({
    required this.enName,
    required this.arName,
    required this.cities,
  });
}

class City {
  @JsonKey(name: 'name_en')
  final String enName;
  @JsonKey(name: 'name_ar')
  final String arName;
  City({
    required this.enName,
    required this.arName,
  });
}
