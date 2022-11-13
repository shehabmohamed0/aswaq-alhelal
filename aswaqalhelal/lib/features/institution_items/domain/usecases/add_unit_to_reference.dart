import 'package:dartz/dartz.dart' hide Unit;
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/unit.dart';
import '../repositories/units_repository.dart';

@lazySingleton
class AddUnitToReference extends UseCase<Unit, AddUnitToReferenceParams> {
  final UnitsRepository _repository;

  AddUnitToReference(this._repository);

  @override
  Future<Either<Failure, Unit>> call(
      {required AddUnitToReferenceParams params}) {
    return _repository.addUnitToReference(params);
  }
}
