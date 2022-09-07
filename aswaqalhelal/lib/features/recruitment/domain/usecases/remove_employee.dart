import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/injectable.dart';

import '../repositories/recruitment_repository.dart';

@lazySingleton
class RemoveEmployee extends UseCase<String, RemoveEmployeeParams> {
  final RecruitmentRepository _repository;

  RemoveEmployee(this._repository);
  @override
  Future<Either<Failure, String>> call({required RemoveEmployeeParams params}) {
    return _repository.removeEmployee(params);
  }
}
