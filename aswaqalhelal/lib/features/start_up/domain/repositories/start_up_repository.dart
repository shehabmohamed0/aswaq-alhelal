import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:dartz/dartz.dart';

abstract class StartUpRepository {
  Future<Either<Failure, bool>> isSeenBefore();
  Future<Either<Failure, bool>> needsAForcedUpdate();
}
