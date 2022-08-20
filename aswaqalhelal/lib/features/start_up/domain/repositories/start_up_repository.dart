import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/dartz.dart';

abstract class StartUpRepository {
  Future<Either<Failure, bool>> isSeenBefore();
}
