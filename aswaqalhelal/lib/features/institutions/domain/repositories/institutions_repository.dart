import 'package:aswaqalhelal/core/params/add_institution_params.dart';
import 'package:aswaqalhelal/core/params/update_institution_params.dart';
import 'package:aswaqalhelal/features/institutions/domain/entities/institution.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/dartz.dart';

abstract class InstitutionsRepository {
  Future<Either<Failure, List<Institution>>> getInstitutions();

  Future<Either<Failure, Institution>> addInstitution(
      AddInstitutionParams params);

  Future<Either<Failure, Institution>> updateInstitution(
      UpdateInstitutionParams params);


      
}
