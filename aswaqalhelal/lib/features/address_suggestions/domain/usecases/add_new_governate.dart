import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/failures/address_suggestion/add_address_new_governate_params.dart';
import '../entities/ref_governate.dart';
import '../repositories/address_suggestions_repository.dart';

@LazySingleton()
class AddNewGovernate extends UseCase<RefGovernate, AddNewGovernateParams> {
  final AddressSuggestionsRepository _repository;

  AddNewGovernate(this._repository);
  @override
  Future<Either<Failure, RefGovernate>> call(
      {required AddNewGovernateParams params}) {
    return _repository.addNewGovenate(params);
  }
}