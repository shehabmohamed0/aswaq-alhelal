import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/params/usecase/usecase.dart';
import '../repositories/distribution_area_repository.dart';


import '../entities/distribution_area.dart';

@LazySingleton()
class UpdateDistributionArea
    extends UseCase<DistributionArea, UpdateDistributionAreaParams> {
  final DistributionAreasRepository _repository;

  UpdateDistributionArea(this._repository);
  @override
  Future<Either<Failure, DistributionArea>> call(
      {required UpdateDistributionAreaParams params}) {
    return _repository.updateDistriputionArea(params);
  }
}
