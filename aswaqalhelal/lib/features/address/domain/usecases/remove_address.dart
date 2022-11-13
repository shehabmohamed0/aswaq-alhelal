import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

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
