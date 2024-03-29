import '../../../institution_items/domain/entities/institution_item.dart';
import '../repositories/items_repository.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/params/no_args_params.dart';
import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetItems extends UseCase<List<InstitutionItem>, NoArgsParams> {
  final ItemsRepository _repository;

  GetItems(this._repository);
  @override
  Future<Either<Failure, List<InstitutionItem>>> call(
      {required NoArgsParams params}) {
    return _repository.getItems();
  }
}
