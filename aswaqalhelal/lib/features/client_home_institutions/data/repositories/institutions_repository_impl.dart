import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/failures/server_failure.dart';
import '../../../../core/params/services/network_info.dart';
import '../../../address/domain/entities/address.dart';
import '../../../auth/domain/entities/institution_profile.dart';
import '../../domain/repositories/institutions_repository.dart';
import '../datasources/institutions_api_service.dart';

@LazySingleton(as: InstitutionsRepository)
class InstitutionsRepositoryImpl extends InstitutionsRepository {
  final InstitutionsApiService _apiService;
  final NetworkInfo _networkInfo;

  InstitutionsRepositoryImpl(this._apiService, this._networkInfo);
  @override
  Future<Either<Failure, List<InstitutionProfile>>> getAddressInstitutions(
      Address address) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final institutions = await _apiService.getInstitutions(address);
      return Right(institutions);
    } catch (e) {
      rethrow;
    }
  }
}
