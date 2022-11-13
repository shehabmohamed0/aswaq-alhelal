import 'package:equatable/equatable.dart';

class ReferenceUnit extends Equatable {
  final String id;
  final String name;
  final String institutionId;
  final DateTime creationTime;

  const ReferenceUnit(
      {required this.id,
      required this.name,
      required this.institutionId,
      required this.creationTime});
  @override
  List<Object?> get props => [id, name, institutionId, creationTime];
}
