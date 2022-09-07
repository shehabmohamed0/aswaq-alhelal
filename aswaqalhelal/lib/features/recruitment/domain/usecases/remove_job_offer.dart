import 'package:root_package/packages/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../repositories/recruitment_repository.dart';

@lazySingleton
class RemoveJobOffer extends UseCase<String, RemoveJobOfferParams> {
  final RecruitmentRepository _repository;

  RemoveJobOffer(this._repository);
  @override
  Future<Either<Failure, String>> call({required RemoveJobOfferParams params}) {
    return _repository.removeJobOffer(params);
  }
}
