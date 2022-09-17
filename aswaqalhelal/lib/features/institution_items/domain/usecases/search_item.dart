import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../entities/reference_item.dart';
import '../repositories/items_repository.dart';
import '../../../../core/params/add_item/search_item_params.dart';
@LazySingleton()
class SearchItem extends UseCase<List<ReferenceItem>, SearchItemParams> {
  final ItemsRepository _repository;
  SearchItem(this._repository);
  @override
  Future<Either<Failure, List<ReferenceItem>>> call({required SearchItemParams params}) {
    return _repository.searchItem(params.seachValue);
  }
}
