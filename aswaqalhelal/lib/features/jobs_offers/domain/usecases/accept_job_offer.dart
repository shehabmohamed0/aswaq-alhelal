import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/injectable.dart';

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
