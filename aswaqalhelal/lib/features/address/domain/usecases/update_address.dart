import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/addresses/update_address_params.dart';
import '../entities/address.dart';
import '../repositories/addresses_repository.dart';

@lazySingleton
class UpdateAddress extends UseCase<Address, UpdateAddressParams> {
  final AddressesRepository _repository;
  UpdateAddress(this._repository);

  @override
  Future<Either<Failure, Address>> call({required UpdateAddressParams params}) {
    return _repository.updateAddress(params);
  }
}
