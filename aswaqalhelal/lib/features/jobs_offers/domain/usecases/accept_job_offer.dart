import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../recruitment/domain/entities/job_offer.dart';
import '../repositories/jobs_offers_repository.dart';

@lazySingleton
class AcceptJobOffer extends UseCase<JobOffer, AcceptJobsOfferParams> {
  final JobsOffersRepository _repository;

  AcceptJobOffer(this._repository);
  @override
  Future<Either<Failure, JobOffer>> call(
      {required AcceptJobsOfferParams params}) {
    return _repository.acceptJobsOffer(params);
  }
}
