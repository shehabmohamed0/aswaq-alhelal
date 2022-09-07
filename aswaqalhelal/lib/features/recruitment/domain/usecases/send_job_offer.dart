import 'package:root_package/packages/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

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
