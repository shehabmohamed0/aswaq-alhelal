import 'package:aswaqalhelal/features/start_up/domain/repositories/start_up_repository.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';
@lazySingleton
class CheckIfSeenBefore extends UseCase<bool, NoArgsParams> {
  final StartUpRepository _repository;

  CheckIfSeenBefore(this._repository);
  @override
  Future<Either<Failure, bool>> call({required NoArgsParams params}) {
    return _repository.isSeenBefore();
  }
}
