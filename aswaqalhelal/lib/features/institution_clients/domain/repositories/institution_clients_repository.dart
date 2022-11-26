import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../auth/data/models/user/non_registered_profile_model.dart';
import '../../../auth/domain/entities/base_profile.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../data/models/institution_client_model.dart';
import '../entities/institution_client.dart';

abstract class InstitutionClientsRepository {
  Future<Either<Failure, UserProfile>> getUserByPhoneNumber(
      GetUserByPhoneNumberParams params);

  Future<Either<Failure, InstitutionClient>> addInstitutionClient(
      AddInstitutionClientParams params);

  Future<Either<Failure, UserProfile>> getInstitutionClients(
      AddInstitutionClientParams params);
}

class GetUserByPhoneNumberParams {
  final String phoneNumber;

  const GetUserByPhoneNumberParams({required this.phoneNumber});
}

class AddInstitutionClientParams {
  final String institutionId;
  final BaseProfile? profile;
  final String? phoneNumber;
  final String? name;

  const AddInstitutionClientParams({
    required this.institutionId,
    this.profile,
    this.phoneNumber,
    this.name,
  }) : assert(
          (profile != null && name == null && phoneNumber == null) ||
              (profile == null && name != null && phoneNumber != null),
          'You must add a value to either profile or (phoneNumber && name)',
        );

  InstitutionClientModel toModel(String id) {
    return InstitutionClientModel(
      id: id,
      institutionId: institutionId,
      profile: profile ??
          NonRegisteredProfileModel(
            id: phoneNumber!,
            userId: phoneNumber!,
            name: name!,
            phoneNumber: phoneNumber!,
          ),
    );
  }

  
}

class GetInstitutionClients {
  final String name;

  GetInstitutionClients(this.name);
}
