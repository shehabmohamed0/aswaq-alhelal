import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/no_args_params.dart';
import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../repositories/start_up_repository.dart';

@lazySingleton
class CheckIfSeenBefore extends UseCase<bool, NoArgsParams> {
  final StartUpRepository _repository;

  CheckIfSeenBefore(this._repository);
  @override
  Future<Either<Failure, bool>> call({required NoArgsParams params}) {
    return _repository.isSeenBefore();
  }
}
