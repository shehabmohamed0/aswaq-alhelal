import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/services/network_info.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/institution_clients/get_user_by_phone_number_failure.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../domain/repositories/institution_clients_repository.dart';
import '../datasources/institution_clients_api_service.dart';

@LazySingleton(as: InstitutionClientsRepository)
class InstitutionClientsRepositoryImpl extends InstitutionClientsRepository {
  final InstitutionClientsApiService _apiService;
  final NetworkInfo _networkInfo;

  InstitutionClientsRepositoryImpl(this._apiService, this._networkInfo);

  @override
  Future<Either<Failure, UserProfile>> addInstitutionClient(
      AddInstitutionClientParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      throw Error();
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, UserProfile>> getUserByPhoneNumber(
      GetUserByPhoneNumberParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final userProfile = await _apiService.getUserByPhoneNumber(params);
      return Right(userProfile);
    } on FirebaseFunctionsException catch (e) {
      if (e.code == 'not-found') {
        return Left(UserNotFoundFailure());
      } else {
        return Left(ServerFailure.general());
      }
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }
}
