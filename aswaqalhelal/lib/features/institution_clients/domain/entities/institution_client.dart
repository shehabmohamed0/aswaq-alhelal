import 'package:aswaqalhelal/features/auth/domain/entities/base_profile.dart';
import 'package:equatable/equatable.dart';

class InstitutionClient extends Equatable {
  final String id;
  final BaseProfile profile;

  const InstitutionClient({
    required this.id,
    required this.profile,
  });

  @override
  List<Object?> get props => [id, profile];
}
