import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/address_suggestion/params.dart';
import '../entities/ref_city.dart';
import '../repositories/address_suggestions_repository.dart';

@LazySingleton()
class GetCitiesSuggestions
    extends UseCase<List<RefCity>, GetCitiesSuggestionsParams>
    implements GetRefAddressParams {
  final AddressSuggestionsRepository _repository;

  GetCitiesSuggestions(this._repository);
  @override
  Future<Either<Failure, List<RefCity>>> call(
      {required GetCitiesSuggestionsParams params}) {
    return _repository.getCitiesSuggestions(params);
  }
}
