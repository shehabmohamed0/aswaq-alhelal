import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../recruitment/domain/entities/job_offer.dart';
import '../repositories/jobs_offers_repository.dart';

@lazySingleton
class GetJobsOffers extends UseCase<List<JobOffer>, GetJobsOffersParams> {
  final JobsOffersRepository _repository;

  GetJobsOffers(this._repository);
  @override
  Future<Either<Failure, List<JobOffer>>> call(
      {required GetJobsOffersParams params}) {
    return _repository.getJobsOffers(params);
  }
}
