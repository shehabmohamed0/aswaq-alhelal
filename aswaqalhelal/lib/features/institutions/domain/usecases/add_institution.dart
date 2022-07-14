import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/add_institution_params.dart';
import '../entities/institution.dart';
import '../repositories/institutions_repository.dart';

@lazySingleton
class AddInstitution extends UseCase<Institution, AddInstitutionParams> {
  AddInstitution(this._repository);
  final InstitutionsRepository _repository;
  @override
  Future<Either<Failure, Institution>> call(
      {required AddInstitutionParams params}) {
    return _repository.addInstitution(params);
  }
}
