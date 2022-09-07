import 'package:root_package/root_package.dart';

import '../../../recruitment/data/models/job_offer_model.dart';
import '../../../recruitment/domain/entities/job_offer.dart';

abstract class JobsOffersRepository {
  Future<Either<Failure, List<JobOffer>>> getJobsOffers(
      GetJobsOffersParams params);
  Future<Either<Failure, JobOffer>> acceptJobsOffer(
      AcceptJobsOfferParams params);
  Future<Either<Failure, JobOffer>> declineJobOffer(
      DeclineJobOfferParams params);
}

class GetJobsOffersParams {
  final String userId;

  GetJobsOffersParams({required this.userId});
}

class AcceptJobsOfferParams {
  final JobOffer jobOffer;

  AcceptJobsOfferParams({required this.jobOffer});
}

class DeclineJobOfferParams {
  final JobOffer jobOffer;

  DeclineJobOfferParams({required this.jobOffer});
}

extension ToData on JobOffer {
  JobOfferModel toModel() => JobOfferModel(
      id: this.id,
      ownerId: ownerId,
      institutionName: institutionName,
      institutionId: institutionId,
      phoneNumber: phoneNumber,
      role: role,
      state: state,
      creationTime: creationTime);
}
