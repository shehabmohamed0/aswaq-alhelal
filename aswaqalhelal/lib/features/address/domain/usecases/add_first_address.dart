import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/addresses/add_first_address_params.dart';
import '../entities/address.dart';
import '../repositories/addresses_repository.dart';

@lazySingleton
class AddFirstAddress extends UseCase<Address, AddFirstAddressParams> {
  final AddressesRepository _repository;
  AddFirstAddress(this._repository);

  @override
  Future<Either<Failure, Address>> call({required AddFirstAddressParams params}) {
    return _repository.addFirstAddress(params);
  }
}
