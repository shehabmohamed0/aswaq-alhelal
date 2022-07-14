import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/addresses/delete_address_params.dart';
import '../repositories/addresses_repository.dart';

@lazySingleton
class RemoveAddress extends UseCase<String, RemoveAddressParams> {
  final AddressesRepository _repository;
  RemoveAddress(this._repository);

  @override
  Future<Either<Failure, String>> call({required RemoveAddressParams params}) {
    return _repository.removeAddress(params);
  }
}
