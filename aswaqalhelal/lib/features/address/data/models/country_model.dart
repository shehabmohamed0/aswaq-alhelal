import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/country.dart';
part 'country_model.g.dart';

@JsonSerializable()
class CountryModel extends Country {
  @JsonKey(name: 'governates')
  final Map<String, GovernateModel> governateModels;
  CountryModel(
      {required String enName,
      required String arName,
      required this.governateModels})
      : super(enName: enName, arName: arName, governates: governateModels);

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}

@JsonSerializable()
class GovernateModel extends Governate {
  @JsonKey(name: 'cities')
  final Map<String, CityModel> cityModels;

  GovernateModel(
      {required String enName,
      required String arName,
      required this.cityModels})
      : super(enName: enName, arName: arName, cities: cityModels);

  factory GovernateModel.fromJson(Map<String, dynamic> json) =>
      _$GovernateModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GovernateModelToJson(this);
}

@JsonSerializable()
class CityModel extends City {
  CityModel({required String enName, required String arName})
      : super(enName: enName, arName: arName);

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
