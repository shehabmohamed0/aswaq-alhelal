import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/params/usecase/usecase.dart';
import '../entities/distribution_area.dart';
import '../repositories/distribution_area_repository.dart';

@LazySingleton()
class AddDistributionArea
    extends UseCase<DistributionArea, AddDistributionAreaParams> {
  final DistributionAreasRepository _repository;

  AddDistributionArea(this._repository);
  @override
  Future<Either<Failure, DistributionArea>> call(
      {required AddDistributionAreaParams params}) {
    return _repository.addDistriputionArea(params);
  }
}
