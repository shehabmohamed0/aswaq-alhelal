import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/params/usecase/usecase.dart';
import '../repositories/distribution_area_repository.dart';


@LazySingleton()
class DeleteDistributionArea
    extends UseCase<String, DeleteDistributionAreaParams> {
  final DistributionAreasRepository _repository;

  DeleteDistributionArea(this._repository);
  @override
  Future<Either<Failure, String>> call(
      {required DeleteDistributionAreaParams params}) {
    return _repository.deleteDistriputionArea(params);
  }
}
