import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/addresses/update_address_params.dart';
import '../entities/address.dart';
import '../repositories/addresses_repository.dart';

@lazySingleton
class UpdateMainAddress extends UseCase<Address, UpdateAddressParams> {
  final AddressesRepository _repository;
  UpdateMainAddress(this._repository);

  @override
  Future<Either<Failure, Address>> call({required UpdateAddressParams params}) {
    return _repository.updateMainAddress(params);
  }
}
