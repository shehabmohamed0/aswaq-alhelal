import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/institution_clients/client_exsists_before_exception.dart';
import '../../../../core/failures/failure.dart';
import '../../../../core/failures/institution_clients/client_exsists_failure.dart';
import '../../../../core/failures/institution_clients/user_not_found_failure.dart';
import '../../../../core/failures/server_failure.dart';
import '../../../../core/params/services/network_info.dart';
import '../../../auth/domain/entities/user_profile.dart';
import '../../domain/entities/institution_client.dart';
import '../../domain/repositories/institution_clients_repository.dart';
import '../datasources/institution_clients_api_service.dart';

@LazySingleton(as: InstitutionClientsRepository)
class InstitutionClientsRepositoryImpl extends InstitutionClientsRepository {
  final InstitutionClientsApiService _apiService;
  final NetworkInfo _networkInfo;

  InstitutionClientsRepositoryImpl(this._apiService, this._networkInfo);

  @override
  Future<Either<Failure, InstitutionClient>> addInstitutionClient(
      AddInstitutionClientParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final institutionClient = await _apiService.addInstitutionClient(params);
      return Right(institutionClient);
    } on ClientExsitsBeforeException {
      //todo: add error message here
      return  Left(ClientExsistsBeforeFailure());
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

  @override
  Future<Either<Failure, UserProfile>> getInstitutionClients(
      AddInstitutionClientParams params) {
    throw UnimplementedError();
  }
}
