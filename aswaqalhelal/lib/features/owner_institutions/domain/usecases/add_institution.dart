import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/add_institution_params/add_institution_params.dart';
import '../../../auth/domain/entities/institution_profile.dart';
import '../repositories/institutions_repository.dart';

@lazySingleton
class AddInstitution extends UseCase<InstitutionProfile, AddInstitutionParams> {
  AddInstitution(this._repository);
  final UserInstitutionsRepository _repository;
  @override
  Future<Either<Failure, InstitutionProfile>> call(
      {required AddInstitutionParams params}) {
    return _repository.addInstitution(params);
  }
}
