import 'package:dartz/dartz.dart' hide Unit;
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../entities/unit.dart';
import '../repositories/units_repository.dart';

@lazySingleton
class GetUnitSuggestions extends UseCase<List<Unit>, GetUnitSuggestionsParams> {
  final UnitsRepository _repository;

  GetUnitSuggestions(this._repository);

  @override
  Future<Either<Failure, List<Unit>>> call(
      {required GetUnitSuggestionsParams params}) {
    return _repository.getUnitSuggestions(params);
  }
}

