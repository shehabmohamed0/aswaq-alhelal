import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:dartz/dartz.dart';

abstract class WorkInstitutionRepository {
  Future<Either<Failure, List<InstitutionProfile>>> getWorkInstitutions(
      GetWorkInstitutionsParams params);
}

class GetWorkInstitutionsParams {
  final String userId;

  GetWorkInstitutionsParams({required this.userId});
}
