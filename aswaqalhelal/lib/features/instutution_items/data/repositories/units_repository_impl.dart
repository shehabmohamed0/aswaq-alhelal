import 'package:dartz/dartz.dart' hide Unit;
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/injectable.dart';

import '../../domain/entities/unit.dart';
import '../../domain/repositories/units_repository.dart';
import '../datasources/units_api_service.dart';

@LazySingleton(as: UnitsRepository)
class UnitsRepositoryImpl extends UnitsRepository {
  final UnitsApiService _apiService;
  final NetworkInfo _networkInfo;

  UnitsRepositoryImpl(this._networkInfo, this._apiService);
  @override
  Future<Either<Failure, Unit>> addUnitToReference(
      AddUnitToReferenceParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final unit = await _apiService.addUnitToReference(params);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, List<Unit>>> getUnitSuggestions(
      GetUnitSuggestionsParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final units = await _apiService.getUnitSuggestions(params);
      return Right(units);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }
}
