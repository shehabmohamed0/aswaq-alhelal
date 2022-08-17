import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart';

import '../entities/distribution_area.dart';
import '../repositories/distribution_area_repository.dart';
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
