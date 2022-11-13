import 'package:aswaqalhelal/core/failures/failure.dart';
import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/services/network_info.dart';
import 'package:dartz/dartz.dart';
import '../../../institution_items/domain/entities/institution_item.dart';

abstract class ItemsRepository {
  Future<Either<Failure, List<InstitutionItem>>> getItems();
}
