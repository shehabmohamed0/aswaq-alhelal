import 'package:dartz/dartz.dart' hide Order;

import '../../../../core/failures/failure.dart';
import '../../../../core/params/institution_receipts/add_institution_receipts_params.dart';
import '../../../../core/params/institution_receipts/get_institution_receipts_params.dart';
import '../../../orders/domain/entities/order.dart';

abstract class InstitutionReceiptsRepository {
  Future<Either<Failure, List<Order>>> getInstitutionReceipts(
      GetInstitutionReceiptsParams params);
  Future<Either<Failure, Order>> addInstitutionReceipts(
      AddInstitutionReceiptParams params);
}
