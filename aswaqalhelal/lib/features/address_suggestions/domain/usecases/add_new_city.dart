import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/failures/address_suggestion/add_address_new_city_params.dart';
import '../entities/entities.dart';
import '../repositories/address_suggestions_repository.dart';

@LazySingleton()
class AddNewCity extends UseCase<RefCity, AddNewCityParams> {
  final AddressSuggestionsRepository _repository;

  AddNewCity(this._repository);
  @override
  Future<Either<Failure, RefCity>> call({required AddNewCityParams params}) {
    return _repository.addNewCity(params);
  }
}
