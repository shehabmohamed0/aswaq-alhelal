import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/services/network_info.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/domain/entities/institution_profile.dart';
import '../../domain/work_institution_repository.dart';
import '../datasources/work_institution_api_service.dart';

@LazySingleton(as: WorkInstitutionRepository)
class WorkInstitutionRepositoryImpl extends WorkInstitutionRepository {
  final WorkIstitutionsApiService _apiService;
  final NetworkInfo _networkInfo;
  WorkInstitutionRepositoryImpl(this._apiService, this._networkInfo);
  @override
  Future<Either<Failure, List<InstitutionProfile>>> getWorkInstitutions(
      GetWorkInstitutionsParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final institutions = await _apiService.getWorkInstitutions(params);

      return Right(institutions);
    } catch (e) {
      rethrow;
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }
}
