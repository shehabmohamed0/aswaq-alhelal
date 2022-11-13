import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../address/domain/entities/address.dart';
import '../../../auth/domain/entities/institution_profile.dart';
import '../repositories/institutions_repository.dart';

@LazySingleton()
class GetAddressInstitutions
    extends UseCase<List<InstitutionProfile>, Address> {
  final InstitutionsRepository _repository;

  GetAddressInstitutions(this._repository);
  @override
  Future<Either<Failure, List<InstitutionProfile>>> call(
      {required Address params}) {
    return _repository.getAddressInstitutions(params);
  }
}
