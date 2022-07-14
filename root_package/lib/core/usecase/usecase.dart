import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class UseCase<Return, Params> {
  Future<Either<Failure, Return>> call({required Params params});
}
