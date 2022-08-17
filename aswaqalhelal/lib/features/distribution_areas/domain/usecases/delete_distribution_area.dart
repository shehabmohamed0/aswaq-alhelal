import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart';

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
