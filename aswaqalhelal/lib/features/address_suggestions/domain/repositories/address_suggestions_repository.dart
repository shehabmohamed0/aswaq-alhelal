import 'package:aswaqalhelal/core/failures/failure.dart';
import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/services/network_info.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/params/address_suggestion/params.dart';
import '../entities/entities.dart';

abstract class AddressSuggestionsRepository {
  Future<Either<Failure, List<RefGovernate>>> getGovernatesSuggestions(
      GetGovernatesSuggestionsParams params);
  Future<Either<Failure, List<RefCity>>> getCitiesSuggestions(
      GetCitiesSuggestionsParams params);
  Future<Either<Failure, List<RefNeighborhood>>> getNeighborhoodsSuggestions(
      GetNeighborhoodsSuggestionsParams params);

  Future<Either<Failure, RefGovernate>> addNewGovenate(
      AddNewGovernateParams params);
  Future<Either<Failure, RefCity>> addNewCity(AddNewCityParams params);
  Future<Either<Failure, RefNeighborhood>> addNewNeighborhood(
      AddNewNeighborhoodParams params);
}
