import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/job_offer.dart';
import '../repositories/recruitment_repository.dart';

@lazySingleton
class GetSentJobOffers extends UseCase<List<JobOffer>, GetSentJobOffersParams> {
  final RecruitmentRepository _repository;

  GetSentJobOffers(this._repository);
  @override
  Future<Either<Failure, List<JobOffer>>> call(
      {required GetSentJobOffersParams params}) {
    return _repository.getSentJobOffers(params);
  }
}
