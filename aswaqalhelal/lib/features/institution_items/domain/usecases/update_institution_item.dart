import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/add_item/params.dart';
import '../entities/institution_item.dart';
import '../repositories/items_repository.dart';

@LazySingleton()
class UpdateInstitutionItem
    extends UseCase<InstitutionItem, UpdateInstitutionItemParams> {
  final ItemsRepository _repository;
  UpdateInstitutionItem(this._repository);
  @override
  Future<Either<Failure, InstitutionItem>> call(
      {required UpdateInstitutionItemParams params}) {
    return _repository.updateInstitutionItems(params);
  }
}
