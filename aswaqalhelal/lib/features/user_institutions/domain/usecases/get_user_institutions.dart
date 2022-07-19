import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../entities/institution.dart';
import '../repositories/institutions_repository.dart';

@lazySingleton
class GetUserInstitutions extends UseCase<List<Institution>, NoArgsParams> {
  GetUserInstitutions(this._repository);
  final UserInstitutionsRepository _repository;
  @override
  Future<Either<Failure, List<Institution>>> call(
      {required NoArgsParams params}) {
    return _repository.getInstitutions();
  }
}
