import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/dartz.dart';

import '../../../user_institutions/domain/entities/institution.dart';

abstract class InstitutionsRepository {
  Future<Either<Failure, List<Institution>>> getInstitutions();
}
