import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/injectable.dart';

import '../entities/job_offer.dart';
import '../repositories/recruitment_repository.dart';

@lazySingleton
class GetSentJobOffers extends UseCase<List<JobOffer>, GetSentJobOffersParams> {
  final RecruitmentRepository _repository;

  GetSentJobOffers(this._repository);
  @override
  Future<Either<Failure, List<JobOffer>>> call({required GetSentJobOffersParams params}) {
    return _repository.getSentJobOffers(params);
  }
}
