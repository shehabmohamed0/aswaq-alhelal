import 'package:aswaqalhelal/features/start_up/data/datasources/startup_remote_api.dart';
import 'package:root_package/core/failures/cache_failure.dart';

import '../../domain/repositories/start_up_repository.dart';
import '../datasources/startup_local_api.dart';
import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/injectable.dart';

@LazySingleton(as: StartUpRepository)
class StartUpRepositoryImpl extends StartUpRepository {
  final StartupLocalApi _localDataSource;
  final StartupRemoteApi _remoteApiService;
  StartUpRepositoryImpl(
    this._remoteApiService,
    this._localDataSource,
  );
  @override
  Future<Either<Failure, bool>> isSeenBefore() async {
    try {
      final seenBefore = await _localDataSource.seenBefore();

      return Right(seenBefore);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> needsAForcedUpdate() async {
    try {
      final needsAForcedUpdate = await _remoteApiService.needsAForcedUpdate();

      return Right(needsAForcedUpdate);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
