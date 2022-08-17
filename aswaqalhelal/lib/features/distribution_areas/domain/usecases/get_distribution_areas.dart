import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart';

import '../entities/distribution_area.dart';
import '../repositories/distribution_area_repository.dart';

@LazySingleton()
class GetDistributionAreas
    extends UseCase<List<DistributionArea>, GetDistributionAreasParams> {
  final DistributionAreasRepository _repository;

  GetDistributionAreas(this._repository);
  @override
  Future<Either<Failure, List<DistributionArea>>> call(
      {required GetDistributionAreasParams params}) {
    return _repository.getDistriputionAreas(params);
  }
}

