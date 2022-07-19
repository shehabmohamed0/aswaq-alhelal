import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart';

import '../../../user_institutions/domain/entities/institution.dart';
import '../../domain/repositories/institutions_repository.dart';
import '../datasources/institutions_api_service.dart';

@LazySingleton(as: InstitutionsRepository)
class InstitutionsRepositoryImpl extends InstitutionsRepository {
  final InstitutionsApiService _apiService;
  final NetworkInfo _networkInfo;

  InstitutionsRepositoryImpl(this._apiService, this._networkInfo);
  @override
  Future<Either<Failure, List<Institution>>> getInstitutions() async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final institutions = await _apiService.getInstitutions();
      return Right(institutions);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }
}
