import 'package:aswaqalhelal/core/params/address_suggestion/params.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/dartz.dart';

import '../entities/ref_address.dart';
import '../entities/ref_city.dart';
import '../entities/ref_district.dart';
import '../entities/ref_governate.dart';

abstract class AddRefAddressUsecase<T extends RefAddress,
    P extends AddRefAddressParams> {
  Future<Either<Failure, T>> execute({required P params});
}

abstract class AddRefGovernate
    implements AddRefAddressUsecase<RefGovernate, AddNewGovernateParams> {
  @override
  Future<Either<Failure, RefGovernate>> execute(
      {required AddNewGovernateParams params});
}

abstract class AddRefCity
    implements AddRefAddressUsecase<RefCity, AddNewCityParams> {
  @override
  Future<Either<Failure, RefCity>> execute({required AddNewCityParams params});
}

abstract class AddRefNeighborhood
    implements AddRefAddressUsecase<RefNeighborhood, AddNewNeighborhoodParams> {
  @override
  Future<Either<Failure, RefNeighborhood>> execute(
      {required AddNewNeighborhoodParams params});
}

abstract class GetRefAddressSuggestionsUsecase<T extends RefAddress,
    P extends GetRefAddressParams> {
  Future<Either<Failure, List<T>>> execute({required P params});
}

abstract class GetGovernatesSuggestions
    implements
        GetRefAddressSuggestionsUsecase<RefGovernate,
            GetGovernatesSuggestionsParams> {
  @override
  Future<Either<Failure, List<RefGovernate>>> execute(
      {required GetGovernatesSuggestionsParams params});
}

abstract class GetCitiesSuggestions
    implements
        GetRefAddressSuggestionsUsecase<RefCity, GetCitiesSuggestionsParams> {
  @override
  Future<Either<Failure, List<RefCity>>> execute(
      {required GetCitiesSuggestionsParams params});
}

abstract class GetNeighborhoodsSuggestions
    implements
        GetRefAddressSuggestionsUsecase<RefNeighborhood,
            GetNeighborhoodsSuggestionsParams> {
  @override
  Future<Either<Failure, List<RefNeighborhood>>> execute(
      {required GetNeighborhoodsSuggestionsParams params});
}
