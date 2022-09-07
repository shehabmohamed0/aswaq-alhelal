import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/injectable.dart';

import '../repositories/start_up_repository.dart';

@lazySingleton
class RegisterFcmDeviceToken extends UseCase<bool, NoArgsParams> {
  final StartUpRepository _repository;

  RegisterFcmDeviceToken(this._repository);
  @override
  Future<Either<Failure, bool>> call({required NoArgsParams params}) {
    return _repository.isSeenBefore();
  }
}
