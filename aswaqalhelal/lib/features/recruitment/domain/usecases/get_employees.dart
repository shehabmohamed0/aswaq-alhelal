import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/injectable.dart';

import '../entities/employee.dart';
import '../repositories/recruitment_repository.dart';

@lazySingleton
class GetEmployees extends UseCase<List<Employee>, GetEmployeesParams> {
  final RecruitmentRepository _repository;

  GetEmployees(this._repository);
  @override
  Future<Either<Failure, List<Employee>>> call({required GetEmployeesParams params}) {
    return _repository.getEmployees(params);
  }
}
