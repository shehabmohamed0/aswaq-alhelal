import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart';

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
