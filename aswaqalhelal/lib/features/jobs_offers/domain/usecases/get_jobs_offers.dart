import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/injectable.dart';

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
