import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';

import '../../../../core/params/add_institution_params/add_institution_params.dart';
import '../../../../core/params/update_institution_params.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:dartz/dartz.dart';

abstract class UserInstitutionsRepository {
  Future<Either<Failure, List<InstitutionProfile>>> getInstitutions();

  Future<Either<Failure, InstitutionProfile>> addInstitution(
      AddInstitutionParams params);

  Future<Either<Failure, InstitutionProfile>> updateInstitution(
      UpdateInstitutionParams params);
}
