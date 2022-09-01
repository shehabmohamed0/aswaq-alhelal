import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/address_suggestion/get_governates_suggestions_params.dart';
import '../entities/ref_governate.dart';
import '../repositories/address_suggestions_repository.dart';

@lazySingleton
class GetGovernatesSuggestions
    extends UseCase<List<RefGovernate>, GetGovernatesSuggestionsParams> implements GetRefAddressParams{
  final AddressSuggestionsRepository _repository;

  GetGovernatesSuggestions(this._repository);
  @override
  Future<Either<Failure, List<RefGovernate>>> call(
      {required GetGovernatesSuggestionsParams params}) {
    return _repository.getGovernatesSuggestions(params);
  }
}
