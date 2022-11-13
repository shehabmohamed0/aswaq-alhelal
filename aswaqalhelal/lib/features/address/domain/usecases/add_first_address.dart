import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/addresses/add_first_address_params.dart';
import '../entities/address.dart';
import '../repositories/addresses_repository.dart';

@lazySingleton
class AddFirstAddress extends UseCase<Address, AddFirstAddressParams> {
  final AddressesRepository _repository;
  AddFirstAddress(this._repository);

  @override
  Future<Either<Failure, Address>> call(
      {required AddFirstAddressParams params}) {
    return _repository.addFirstAddress(params);
  }
}
