import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/params/usecase/usecase.dart';
import '../entities/institution_client.dart';
import '../repositories/institution_clients_repository.dart';

@lazySingleton
class AddInstitutionClient
    extends UseCase<InstitutionClient, AddInstitutionClientParams> {
  final InstitutionClientsRepository _repository;

  AddInstitutionClient(this._repository);

  @override
  Future<Either<Failure, InstitutionClient>> call(
      {required AddInstitutionClientParams params}) {
    return _repository.addInstitutionClient(params);
  }
}
