import 'package:aswaqalhelal/features/work_institutions/data/datasources/work_institution_api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../user_institutions/domain/entities/institution.dart';
import '../../domain/work_institution_repository.dart';

@LazySingleton(as: WorkInstitutionRepository)
class WorkInstitutionRepositoryImpl extends WorkInstitutionRepository {
  final WorkIstitutionsApiService _apiService;
  final NetworkInfo _networkInfo;
  WorkInstitutionRepositoryImpl(this._apiService, this._networkInfo);
  @override
  Future<Either<Failure, List<Institution>>> getWorkInstitutions(
      GetWorkInstitutionsParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final institutions = await _apiService.getWorkInstitutions(params);

      return Right(institutions);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }
}
