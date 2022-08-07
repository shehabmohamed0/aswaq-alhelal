import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/failures/address_suggestion/get_cities_suggestions_params.dart';
import '../entities/ref_city.dart';
import '../repositories/address_suggestions_repository.dart';

@LazySingleton()
class GetCitiesSuggestions
    extends UseCase<List<RefCity>, GetCitiesSuggestionsParams> {
  final AddressSuggestionsRepository _repository;

  GetCitiesSuggestions(this._repository);
  @override
  Future<Either<Failure, List<RefCity>>> call(
      {required GetCitiesSuggestionsParams params}) {
    return _repository.getCitiesSuggestions(params);
  }
}
