import 'dart:developer';

import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart';

import '../../../../core/params/add_institution_params/add_institution_params.dart';
import '../../../../core/params/update_institution_params.dart';
import '../../../auth/domain/entities/institution_profile.dart';
import '../../domain/repositories/institutions_repository.dart';
import '../datasources/user_institutions_service_api.dart';

@LazySingleton(as: UserInstitutionsRepository)
class UserInstitutionsRepositoryImpl extends UserInstitutionsRepository {
  final UserInstitutionsServiceApi _serviceApi;
  final NetworkInfo _networkInfo;

  UserInstitutionsRepositoryImpl(this._serviceApi, this._networkInfo);

  @override
  Future<Either<Failure, List<InstitutionProfile>>> getInstitutions() async {
    // if (!await _networkInfo.isConnected) {
    //   return Left(ServerFailure.internetConnection());
    // }
    try {
      final institutions = await _serviceApi.getInstitutions();
      return Right(institutions);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, InstitutionProfile>> addInstitution(
      AddInstitutionParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final institutions = await _serviceApi.addInstitution(params);
      return Right(institutions);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, InstitutionProfile>> updateInstitution(
      UpdateInstitutionParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final institutions = await _serviceApi.updateInstitution(params);
      return Right(institutions);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }
}
