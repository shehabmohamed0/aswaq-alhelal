import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/params/no_args_params.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../entities/geo_point.dart';
import '../repositories/addresses_repository.dart';

@lazySingleton
class GetCurrentLocation extends UseCase<GeoPoint, NoArgsParams> {
  final AddressesRepository _repository;
  GetCurrentLocation(this._repository);

  @override
  Future<Either<Failure, GeoPoint>> call({required NoArgsParams params}) {
    return _repository.getCurrentLocation();
  }
}
