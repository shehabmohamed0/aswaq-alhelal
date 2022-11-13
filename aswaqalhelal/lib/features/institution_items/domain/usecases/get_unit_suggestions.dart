import 'package:dartz/dartz.dart' hide Unit;
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

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
