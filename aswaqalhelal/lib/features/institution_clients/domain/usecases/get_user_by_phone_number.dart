import 'package:aswaqalhelal/features/auth/domain/entities/user_profile.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

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
