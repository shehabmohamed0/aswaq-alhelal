import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../work_institution_repository.dart';

@lazySingleton
class GetWorkInstitutions
    extends UseCase<List<InstitutionProfile>, GetWorkInstitutionsParams> {
  final WorkInstitutionRepository _repository;

  GetWorkInstitutions(this._repository);
  @override
  Future<Either<Failure, List<InstitutionProfile>>> call(
      {required GetWorkInstitutionsParams params}) {
    return _repository.getWorkInstitutions(params);
  }
}
