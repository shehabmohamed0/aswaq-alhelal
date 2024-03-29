import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/address_suggestion/params.dart';
import '../entities/entities.dart';
import '../repositories/address_suggestions_repository.dart';

@LazySingleton()
class AddNewCity extends UseCase<RefCity, AddNewCityParams>
// implements AddRefCity
{
  final AddressSuggestionsRepository _repository;

  AddNewCity(this._repository);
  @override
  Future<Either<Failure, RefCity>> call({required AddNewCityParams params}) {
    return _repository.addNewCity(params);
  }
}
