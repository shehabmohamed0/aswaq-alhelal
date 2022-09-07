import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/json_converters/time_stamp_converter.dart';
import 'package:root_package/packages/cloud_firestore.dart';

import '../../domain/entities/employee.dart';

part 'employee_model.g.dart';

@JsonSerializable(converters: [TimestampConverter()])
class EmployeeModel extends Employee {
  EmployeeModel({
    required String userId,
    required String institutionId,
    required String? name,
    required String phoneNumber,
    required String role,
    required DateTime creationTime,
  }) : super(
            userId: userId,
            institutionId: institutionId,
            name: name,
            phoneNumber: phoneNumber,
            role: role,
            creationTime: creationTime);

  factory EmployeeModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final address = EmployeeModel.fromJson(document.data()!);

    return address._copyWithId(document.id);
  }
  EmployeeModel _copyWithId(String id) => EmployeeModel(
      userId: id,
      institutionId: institutionId,
      name: name,
      phoneNumber: phoneNumber,
      role: role,
      creationTime: creationTime);
  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeModelToJson(this);
}
