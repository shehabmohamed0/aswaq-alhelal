import 'package:aswaqalhelal/features/address/domain/entities/address.dart';
import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../user_institutions/domain/entities/institution.dart';
import '../repositories/institutions_repository.dart';

@LazySingleton()
class GetAddressInstitutions extends UseCase<List<Institution>, Address> {
  final InstitutionsRepository _repository;

  GetAddressInstitutions(this._repository);
  @override
  Future<Either<Failure, List<Institution>>> call({required Address params}) {
    return _repository.getAddressInstitutions(params);
  }
}
