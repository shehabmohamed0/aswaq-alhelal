import '../../../../core/params/add_item/params.dart';
import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entities/institution_item.dart';
import '../repositories/items_repository.dart';

@LazySingleton()
class AddInstitutionItem
    extends UseCase<InstitutionItem, AddInstitutionItemParams> {
  final ItemsRepository _repository;
  AddInstitutionItem(this._repository);
  @override
  Future<Either<Failure, InstitutionItem>> call(
      {required AddInstitutionItemParams params}) {
    return _repository.addInstitutionItem(params);
  }
}
