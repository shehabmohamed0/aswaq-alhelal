import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

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
