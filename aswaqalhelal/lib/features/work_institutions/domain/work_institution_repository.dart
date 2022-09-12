import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/dartz.dart';

import '../../user_institutions/domain/entities/institution.dart';

abstract class WorkInstitutionRepository {
  Future<Either<Failure, List<Institution>>> getWorkInstitutions(
      GetWorkInstitutionsParams params);
}

class GetWorkInstitutionsParams {
  final String userId;

  GetWorkInstitutionsParams({required this.userId});
}
