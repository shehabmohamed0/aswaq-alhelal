import 'package:root_package/core/failures/cache_failure.dart';

import '../../domain/repositories/start_up_repository.dart';
import '../datasources/local_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/injectable.dart';

@LazySingleton(as: StartUpRepository)
class StartUpRepositoryImpl extends StartUpRepository {
  final LocalDataSource _localDataSource;

  StartUpRepositoryImpl(this._localDataSource);
  @override
  Future<Either<Failure, bool>> isSeenBefore() async {
    try {
      final seenBefore = await _localDataSource.seenBefore();

      return Right(seenBefore);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
