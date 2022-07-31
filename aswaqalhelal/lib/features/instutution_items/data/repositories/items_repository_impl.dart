import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:root_package/core/exceptions/file_upload_exception.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/failures/file_upload_failure.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/add_item/params.dart';
import '../../domain/entities/institution_item.dart';
import '../../domain/entities/reference_item.dart';
import '../../domain/repositories/items_repository.dart';
import '../datasources/items_api_service.dart';

@LazySingleton(as: ItemsRepository)
class ItemsRepositoryImpl extends ItemsRepository {
  final ItemsApiService _itemsApiService;
  final NetworkInfo _networkInfo;
  ItemsRepositoryImpl(this._itemsApiService, this._networkInfo);
  @override
  Future<Either<Failure, List<ReferenceItem>>> searchItem(String value) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final items = await _itemsApiService.searchItem(value);
      return Right(items);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, InstitutionItem>> addInstitutionItem(
      AddInstitutionItemParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final items = await _itemsApiService.addInstitutionItem(params);
      return Right(items);
    } on UploadFileException {
      return Left(UploadFileFailure.image());
    } on Exception catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, InstitutionItem>> addRefAndInstitutionItem(
      AddRefAndInstitutionItemParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final items = await _itemsApiService.addRefAndInstitutionItem(params);
      return Right(items);
    } on UploadFileException {
      return Left(UploadFileFailure.image());
    } on Exception catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, List<InstitutionItem>>> getInstitutionItems(
      GetInstitutionItemsParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final items = await _itemsApiService.getInstitutionItems(params);
      return Right(items);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, InstitutionItem>> updateInstitutionItems(
      UpdateInstitutionItemParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final items = await _itemsApiService.updateInstitutionItem(params);
      return Right(items);
    } on UploadFileException catch (e) {
      log(e.toString());

      return Left(UploadFileFailure.image());
    } on Exception catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }
}
