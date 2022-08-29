import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart';

import '../../../address/domain/entities/address.dart';
import '../../../user_institutions/domain/entities/institution.dart';
import '../../domain/repositories/institutions_repository.dart';
import '../datasources/institutions_api_service.dart';

@LazySingleton(as: InstitutionsRepository)
class InstitutionsRepositoryImpl extends InstitutionsRepository {
  final InstitutionsApiService _apiService;
  final NetworkInfo _networkInfo;

  InstitutionsRepositoryImpl(this._apiService, this._networkInfo);
  @override
  Future<Either<Failure, List<Institution>>> getAddressInstitutions(
      Address address) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final institutions = await _apiService.getInstitutions(address);
      return Right(institutions);
    } catch (e) {
      print(e);
      return Left(ServerFailure.general());
    }
  }
}
