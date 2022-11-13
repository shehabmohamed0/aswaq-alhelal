import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

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
