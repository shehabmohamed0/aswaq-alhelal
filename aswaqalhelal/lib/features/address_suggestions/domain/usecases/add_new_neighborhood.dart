import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/address_suggestion/add_address_new_neighborhood_params.dart';
import '../entities/entities.dart';
import '../repositories/address_suggestions_repository.dart';

@LazySingleton()
class AddNewNeighborhood
    extends UseCase<RefNeighborhood, AddNewNeighborhoodParams> {
  final AddressSuggestionsRepository _repository;

  AddNewNeighborhood(this._repository);
  @override
  Future<Either<Failure, RefNeighborhood>> call(
      {required AddNewNeighborhoodParams params}) {
    return _repository.addNewNeighborhood(params);
  }
}
