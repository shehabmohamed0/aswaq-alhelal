import 'package:aswaqalhelal/core/params/no_args_params.dart';
import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/address.dart';
import '../repositories/addresses_repository.dart';

@lazySingleton
class GetAddresses extends UseCase<List<Address>, NoArgsParams> {
  final AddressesRepository _repository;
  GetAddresses(this._repository);

  @override
  Future<Either<Failure, List<Address>>> call({required NoArgsParams params}) {
    return _repository.getAddresses();
  }
}
