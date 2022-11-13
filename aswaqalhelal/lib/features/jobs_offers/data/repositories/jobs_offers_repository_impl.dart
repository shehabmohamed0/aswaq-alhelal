import 'dart:developer';

import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/features/recruitment/domain/entities/job_offer.dart';
import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/services/network_info.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/jobs_offers_repository.dart';
import '../datasources/jobs_offers_api_service.dart';

@LazySingleton(as: JobsOffersRepository)
class JobsOffersRepositoryImpl extends JobsOffersRepository {
  final JobsOffersApiService _apiService;
  final NetworkInfo _networkInfo;

  JobsOffersRepositoryImpl(this._apiService, this._networkInfo);
  @override
  Future<Either<Failure, List<JobOffer>>> getJobsOffers(
      GetJobsOffersParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final offers = await _apiService.getJobOffers(params);

      return Right(offers);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, JobOffer>> acceptJobsOffer(
      AcceptJobsOfferParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final offer = await _apiService.acceptJobOffers(params);

      return Right(offer);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, JobOffer>> declineJobOffer(
      DeclineJobOfferParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final offer = await _apiService.declineJobOffers(params);

      return Right(offer);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }
}
