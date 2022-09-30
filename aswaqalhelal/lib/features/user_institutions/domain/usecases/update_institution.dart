//UpdateInstitution
import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/update_institution_params.dart';
import '../repositories/institutions_repository.dart';

@lazySingleton
class UpdateInstitution extends UseCase<InstitutionProfile, UpdateInstitutionParams> {
  UpdateInstitution(this._repository);
  final UserInstitutionsRepository _repository;
  @override
  Future<Either<Failure, InstitutionProfile>> call(
      {required UpdateInstitutionParams params}) {
    return _repository.updateInstitution(params);
  }
}
