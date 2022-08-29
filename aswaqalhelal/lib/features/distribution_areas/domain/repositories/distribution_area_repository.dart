import 'package:root_package/root_package.dart';

import '../../../address_suggestions/domain/entities/entities.dart';
import '../../data/models/distribution_area_model.dart';
import '../entities/distribution_area.dart';

abstract class DistributionAreasRepository {
  Future<Either<Failure, List<DistributionArea>>> getDistriputionAreas(
      GetDistributionAreasParams params);

  Future<Either<Failure, DistributionArea>> addDistriputionArea(
      AddDistributionAreaParams params);

  Future<Either<Failure, DistributionArea>> updateDistriputionArea(
      UpdateDistributionAreaParams params);

  Future<Either<Failure, String>> deleteDistriputionArea(
      DeleteDistributionAreaParams params);
}

class GetDistributionAreasParams {
  final String institutionId;

  GetDistributionAreasParams({required this.institutionId});
}

class AddDistributionAreaParams {
  final String institutionId;
  final RefGovernate refGovernate;
  final RefCity? refCity;
  final RefNeighborhood? refNeighborhood;
  AddDistributionAreaParams({
    required this.institutionId,
    required this.refGovernate,
    required this.refCity,
    required this.refNeighborhood,
  });

  String _getParentId() {
    if (refNeighborhood != null) {
      return refCity!.id;
    }
    return refGovernate.id;
  }

  DistributionAreaModel toModel(String id) => DistributionAreaModel(
        id: id,
        institutionId: institutionId,
        parentId: _getParentId(),
        country: 'egypt',
        governate: refGovernate.name,
        city: refCity?.name,
        neighborhood: refNeighborhood?.name,
      );
}

class UpdateDistributionAreaParams {
  final String institutionId;

  final DistributionArea distributionArea;
  final RefGovernate refGovernate;
  final RefCity? refCity;
  final RefNeighborhood? refNeighborhood;

  UpdateDistributionAreaParams({
    required this.institutionId,
    required this.distributionArea,
    required this.refGovernate,
    required this.refCity,
    required this.refNeighborhood,
  });
  DistributionAreaModel toModel(String id) => DistributionAreaModel(
        id: id,
        parentId: _getParentId(),
        institutionId: institutionId,
        country: 'egypt',
        governate: refGovernate.name,
        city: refCity?.name,
        neighborhood: refNeighborhood?.name,
      );
  String _getParentId() {
    if (refNeighborhood != null) {
      return refNeighborhood!.id;
    }
    if (refCity != null) {
      return refCity!.id;
    }
    return refGovernate.id;
  }
}

class DeleteDistributionAreaParams {
  final String institutionId;
  final DistributionArea distributionArea;

  DeleteDistributionAreaParams({
    required this.institutionId,
    required this.distributionArea,
  });
}
