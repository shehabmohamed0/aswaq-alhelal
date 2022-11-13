import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../auth/domain/entities/user_profile.dart';

abstract class InstitutionClientsRepository {
  Future<Either<Failure, UserProfile>> getUserByPhoneNumber(
      GetUserByPhoneNumberParams params);
  Future<Either<Failure, UserProfile>> addInstitutionClient(
      AddInstitutionClientParams params);
}

class GetUserByPhoneNumberParams {
  final String phoneNumber;

  const GetUserByPhoneNumberParams({required this.phoneNumber});
}

class AddInstitutionClientParams {}
