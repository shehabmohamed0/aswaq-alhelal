import 'dart:developer';

import 'package:aswaqalhelal/core/failures/receuitment/failures.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/services/network_info.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../l10n/l10n.dart';
import '../../domain/entities/employee.dart';
import '../../domain/entities/job_offer.dart';
import '../../domain/repositories/recruitment_repository.dart';
import '../datasources/recruitment_api_service.dart';

@LazySingleton(as: RecruitmentRepository)
class RecruitmentRepositoryImpl extends RecruitmentRepository {
  final RecruitmentApiService _apiService;
  final NetworkInfo _networkInfo;
  RecruitmentRepositoryImpl(this._apiService, this._networkInfo);

  @override
  Future<Either<Failure, List<Employee>>> getEmployees(
      GetEmployeesParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final employees = await _apiService.getEmployees(params);
      return Right(employees);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, List<JobOffer>>> getSentJobOffers(
      GetSentJobOffersParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final jobOffers = await _apiService.getSentJobOffers(params);
      return Right(jobOffers);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, String>> removeEmployee(
      RemoveEmployeeParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final employeeId = await _apiService.removeEmployee(params);
      return Right(employeeId);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, JobOffer>> sendJobOffer(
      SendJobOfferParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final jobOffer = await _apiService.sendJobOffer(params);
      return Right(jobOffer);
    } on FirebaseFunctionsException catch (e) {
      if (e.code == 'not-found') {
        return Left(UserNotFoundFailure(
            AppLocalizations.current.thePhoneNumberDoesNotCorrespondToAnyUser));
      }
      if (e.code == 'already-exists') {
        return Left(AlreadySendOfferFailure(
            AppLocalizations.current.alreadySentAnOfferToThisUser));
      }
      if (e.code == 'failed-precondition') {
        return Left(AlreadySendOfferFailure(AppLocalizations
            .current.thisUserIsCurrentlyWorkingForTheInstitution));
      }
      if (e.code == 'internal') {
        return Left(
            AlreadySendOfferFailure(AppLocalizations.current.serverError));
      } else {
        return Left(ServerFailure.general());
      }
    } on Exception {
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, String>> removeJobOffer(
      RemoveJobOfferParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final jobOffer = await _apiService.removeJobOffer(params);
      return Right(jobOffer);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }
}
