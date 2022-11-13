import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../recruitment/domain/entities/job_offer.dart';
import '../repositories/jobs_offers_repository.dart';

@lazySingleton
class DeclineJobOffer extends UseCase<JobOffer, DeclineJobOfferParams> {
  final JobsOffersRepository _repository;

  DeclineJobOffer(this._repository);
  @override
  Future<Either<Failure, JobOffer>> call(
      {required DeclineJobOfferParams params}) {
    return _repository.declineJobOffer(params);
  }
}
