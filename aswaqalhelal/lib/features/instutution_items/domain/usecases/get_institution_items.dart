import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/params/add_item/params.dart';
import '../entities/institution_item.dart';
import '../repositories/items_repository.dart';

@LazySingleton()
class GetInstitutionItems
    extends UseCase<List<InstitutionItem>, GetInstitutionItemsParams> {
  final ItemsRepository _repository;
  GetInstitutionItems(this._repository);
  @override
  Future<Either<Failure, List<InstitutionItem>>> call(
      {required GetInstitutionItemsParams params}) {
    return _repository.getInstitutionItems(params);
  }
}
