import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../entities/country.dart';
import '../repositories/addresses_repository.dart';

@lazySingleton
class GetCountry extends UseCase<Country, NoArgsParams> {
  final AddressesRepository _repository;
  GetCountry(this._repository);

  @override
  Future<Either<Failure,Country>> call({required NoArgsParams params}) {
    return _repository.getCountry();
  }
}
