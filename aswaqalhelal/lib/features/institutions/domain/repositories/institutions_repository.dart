import 'package:aswaqalhelal/features/address/domain/entities/address.dart';
import 'package:aswaqalhelal/features/auth/domain/entities/institution_profile.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/dartz.dart';


abstract class InstitutionsRepository {
  Future<Either<Failure, List<InstitutionProfile>>> getAddressInstitutions(
      Address address);
}
