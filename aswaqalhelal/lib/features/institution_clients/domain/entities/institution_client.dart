import 'package:equatable/equatable.dart';

import '../../../auth/domain/entities/base_profile.dart';

class InstitutionClient extends Equatable {
  final String id;
  final String institutionId;
  final BaseProfile profile;


  const InstitutionClient({
    required this.id,
    required this.institutionId,
    required this.profile,
  });

  @override
  List<Object?> get props => [id, institutionId, profile];
}
