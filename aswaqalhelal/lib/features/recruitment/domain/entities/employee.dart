
import 'package:json_annotation/json_annotation.dart';

class Employee {
  final String userId;
  final String institutionId;
  final String? name;
  final String phoneNumber;
  final String role;
  final DateTime creationTime;

  Employee({
    required this.userId,
    required this.institutionId,
    required this.name,
    required this.phoneNumber,
    required this.role,
    required this.creationTime,
  });
}
