import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/injectable.dart';

import '../../domain/entities/distribution_area.dart';
import '../../domain/repositories/distribution_area_repository.dart';
import '../datasources/distribution_area_api_service.dart';

@LazySingleton(as: DistributionAreasRepository)
class DistributionAreasRepositoryImpl extends DistributionAreasRepository {
  final DistributionAreaApiService _apiService;
  final NetworkInfo _networkInfo;

  DistributionAreasRepositoryImpl(this._apiService, this._networkInfo);

  @override
  Future<Either<Failure, List<DistributionArea>>> getDistriputionAreas(
      GetDistributionAreasParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final distributionAreas = await _apiService.getDistriputionAreas(params);
      return Right(distributionAreas);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, DistributionArea>> addDistriputionArea(
      AddDistributionAreaParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final distributionArea = await _apiService.addDistriputionArea(params);
      return Right(distributionArea);
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, String>> deleteDistriputionArea(
      DeleteDistributionAreaParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final distributionAreaId =
          await _apiService.deleteDistriputionArea(params);
      return Right(distributionAreaId);
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, DistributionArea>> updateDistriputionArea(
      UpdateDistributionAreaParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final distributionArea = await _apiService.updateDistriputionArea(params);
      return Right(distributionArea);
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure.general());
    }
  }
}
