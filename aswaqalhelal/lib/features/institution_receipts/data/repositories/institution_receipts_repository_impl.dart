import 'dart:developer';

import 'package:dartz/dartz.dart' hide Order;
import 'package:aswaqalhelal/core/params/services/network_info.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/failures/server_failure.dart';
import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../../../../core/params/institution_receipts/get_institution_receipts_params.dart';
import '../../../orders/domain/entities/order.dart';
import '../../domain/repositories/institution_receipts_repository.dart';
import '../datasources/institution_receipts_api_service.dart';

@LazySingleton(as: InstitutionReceiptsRepository)
class InstitutionReceiptsRepositoryImpl extends InstitutionReceiptsRepository {
  final InstitutionReceiptsApiService _apiService;
  final NetworkInfo _networkInfo;
  InstitutionReceiptsRepositoryImpl(this._apiService, this._networkInfo);

  @override
  Future<Either<Failure, Order>> addInstitutionReceipts(
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
  Future<Either<Failure, List<Order>>> getInstitutionReceipts(
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
