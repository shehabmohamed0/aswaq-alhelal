import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/failures/address_suggestion/params.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/address_suggestions_repository.dart';
import '../datasources/address_suggestions_api_service.dart';

@LazySingleton(as: AddressSuggestionsRepository)
class AddressSuggestionsRepositoryImpl implements AddressSuggestionsRepository {
  final AddressSuggestionsApiService _apiService;

  const AddressSuggestionsRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, List<RefGovernate>>> getGovernatesSuggestions(
      GetGovernatesSuggestionsParams params) async {
    try {
      final suggestions = await _apiService.getGovernateSuggestions(params);
      return Right(suggestions);
    } catch (e) {
      print(e);
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, List<RefCity>>> getCitiesSuggestions(
      GetCitiesSuggestionsParams params) async {
    try {
      final suggestions = await _apiService.getCitiesSuggestions(params);
      return Right(suggestions);
    } catch (e) {
      print(e);
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, List<RefNeighborhood>>> getNeighborhoodsSuggestions(
      GetNeighborhoodsSuggestionsParams params) async {
    try {
      final suggestions = await _apiService.getNeighborhoodsSuggestions(params);
      return Right(suggestions);
    } catch (e) {
      print(e);
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, RefGovernate>> addNewGovenate(
      AddNewGovernateParams params) async{
  try {
      final refGovernate = await _apiService.addNewGovernate(params);
      return Right(refGovernate);
    } catch (e) {
      print(e);
      return Left(ServerFailure.general());
    }

  }

  @override
  Future<Either<Failure, RefCity>> addNewCity(AddNewCityParams params) async {
    try {
      final refCity = await _apiService.addNewCity(params);
      return Right(refCity);
    } catch (e) {
      print(e);
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, RefNeighborhood>> addNewNeighborhood(
      AddNewNeighborhoodParams params) async{
         try {
      final refNeighborhood = await _apiService.addNewNeighborhood(params);
      return Right(refNeighborhood);
    } catch (e) {
      print(e);
      return Left(ServerFailure.general());
    }
  }
}
