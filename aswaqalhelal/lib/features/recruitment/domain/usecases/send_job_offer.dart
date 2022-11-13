import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/job_offer.dart';
import '../repositories/recruitment_repository.dart';

@lazySingleton
class SendJobOffer extends UseCase<JobOffer, SendJobOfferParams> {
  final RecruitmentRepository _repository;

  SendJobOffer(this._repository);
  @override
  Future<Either<Failure, JobOffer>> call({required SendJobOfferParams params}) {
    return _repository.sendJobOffer(params);
  }
}
