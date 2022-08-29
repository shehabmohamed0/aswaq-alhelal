import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../../../../core/params/institution_receipts/get_institution_receipts_params.dart';
import '../../domain/entities/receipt.dart';
import '../../domain/repositories/institution_receipts_repository.dart';
import '../datasources/institution_receipts_api_service.dart';

@LazySingleton(as: InstitutionReceiptsRepository)
class InstitutionReceiptsRepositoryImpl extends InstitutionReceiptsRepository {
  final InstitutionReceiptsApiService _apiService;

  InstitutionReceiptsRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, Receipt>> addInstitutionReceipts(
      AddInstitutionReceiptParams params) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Receipt>>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params) {
    throw UnimplementedError();
  }
}
