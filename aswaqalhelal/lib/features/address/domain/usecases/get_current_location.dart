import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/no_args_params.dart';
import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

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
