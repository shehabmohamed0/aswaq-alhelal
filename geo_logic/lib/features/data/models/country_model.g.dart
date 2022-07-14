// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      enName: json['name_en'] as String,
      arName: json['name_ar'] as String,
      governateModels: (json['governates'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, GovernateModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'name_en': instance.enName,
      'name_ar': instance.arName,
      'governates': instance.governateModels,
    };

GovernateModel _$GovernateModelFromJson(Map<String, dynamic> json) =>
    GovernateModel(
      enName: json['name_en'] as String,
      arName: json['name_ar'] as String,
      cityModels: (json['cities'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, CityModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$GovernateModelToJson(GovernateModel instance) =>
    <String, dynamic>{
      'name_en': instance.enName,
      'name_ar': instance.arName,
      'cities': instance.cityModels,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      enName: json['name_en'] as String,
      arName: json['name_ar'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'name_en': instance.enName,
      'name_ar': instance.arName,
    };
