import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/domain/entities/user_profile.dart';
import '../repositories/institution_clients_repository.dart';

@lazySingleton
class AddInstitutionClient
    extends UseCase<UserProfile, AddInstitutionClientParams> {
  final InstitutionClientsRepository _repository;

  AddInstitutionClient(this._repository);

  @override
  Future<Either<Failure, UserProfile>> call(
      {required AddInstitutionClientParams params}) {
    return _repository.addInstitutionClient(params);
  }
}
