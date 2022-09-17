import 'package:dartz/dartz.dart' hide Unit;
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

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
