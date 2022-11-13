import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/no_args_params.dart';
import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../repositories/institutions_repository.dart';

@lazySingleton
class GetUserInstitutions
    extends UseCase<List<InstitutionProfile>, NoArgsParams> {
  GetUserInstitutions(this._repository);
  final UserInstitutionsRepository _repository;
  @override
  Future<Either<Failure, List<InstitutionProfile>>> call(
      {required NoArgsParams params}) {
    return _repository.getInstitutions();
  }
}
