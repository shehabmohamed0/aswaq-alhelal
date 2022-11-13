import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/addresses/add_address_params.dart';
import '../entities/address.dart';
import '../repositories/addresses_repository.dart';

@lazySingleton
class AddAddress extends UseCase<Address, AddAddressParams> {
  final AddressesRepository _repository;
  AddAddress(this._repository);

  @override
  Future<Either<Failure, Address>> call({required AddAddressParams params}) {
    return _repository.addAddress(params);
  }
}
