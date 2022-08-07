import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/failures/address_suggestion/get_neighborhoodss_suggestions_params.dart';
import '../entities/ref_district.dart';
import '../repositories/address_suggestions_repository.dart';

@LazySingleton()
class GetNeighborhoodsSuggestions
    extends UseCase<List<RefNeighborhood>, GetNeighborhoodsSuggestionsParams> {
  final AddressSuggestionsRepository _repository;

  GetNeighborhoodsSuggestions(this._repository);
  @override
  Future<Either<Failure, List<RefNeighborhood>>> call(
      {required GetNeighborhoodsSuggestionsParams params}) {
    return _repository.getNeighborhoodsSuggestions(params);
  }
}
