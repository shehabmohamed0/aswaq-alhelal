// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    EmployeeModel(
      userId: json['userId'] as String,
      institutionId: json['institutionId'] as String,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      role: json['role'] as String,
      creationTime: const TimestampConverter()
          .fromJson(json['creationTime'] as Timestamp),
    );

Map<String, dynamic> _$EmployeeModelToJson(EmployeeModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'institutionId': instance.institutionId,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'role': instance.role,
      'creationTime': const TimestampConverter().toJson(instance.creationTime),
    };
