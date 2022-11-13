import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/employee.dart';
import '../repositories/recruitment_repository.dart';

@lazySingleton
class GetEmployees extends UseCase<List<Employee>, GetEmployeesParams> {
  final RecruitmentRepository _repository;

  GetEmployees(this._repository);
  @override
  Future<Either<Failure, List<Employee>>> call(
      {required GetEmployeesParams params}) {
    return _repository.getEmployees(params);
  }
}
