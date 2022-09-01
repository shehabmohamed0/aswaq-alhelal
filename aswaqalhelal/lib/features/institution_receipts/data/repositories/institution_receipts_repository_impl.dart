import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/failures/failures.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../../../../core/params/institution_receipts/get_institution_receipts_params.dart';
import '../../domain/entities/receipt.dart';
import '../../domain/repositories/institution_receipts_repository.dart';
import '../datasources/institution_receipts_api_service.dart';

@LazySingleton(as: InstitutionReceiptsRepository)
class InstitutionReceiptsRepositoryImpl extends InstitutionReceiptsRepository {
  final InstitutionReceiptsApiService _apiService;
  final NetworkInfo _networkInfo;
  InstitutionReceiptsRepositoryImpl(this._apiService, this._networkInfo);

  @override
  Future<Either<Failure, Receipt>> addInstitutionReceipts(
      AddInstitutionReceiptParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final receipt = await _apiService.addInstitutionReceipt(params);

      return Right(receipt);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, List<Receipt>>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final receipt = await _apiService.getInstitutionReceipts(params);

      return Right(receipt);
    } catch (e) {
      return Left(ServerFailure.general());
    }
  }
}
