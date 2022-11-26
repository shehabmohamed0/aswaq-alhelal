import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/params/usecase/usecase.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../repositories/institution_clients_repository.dart';

@lazySingleton
class GetUserByPhoneNumber
    extends UseCase<UserProfile, GetUserByPhoneNumberParams> {
  final InstitutionClientsRepository _repository;

  GetUserByPhoneNumber(this._repository);
  @override
  Future<Either<Failure, UserProfile>> call(
      {required GetUserByPhoneNumberParams params}) {
    return _repository.getUserByPhoneNumber(params);
  }
}
