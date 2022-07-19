
import 'package:root_package/packages/injectable.dart';
import 'package:root_package/root_package.dart';

import '../../../instutution_items/domain/entities/institution_item.dart';
import '../../domain/repositories/items_repository.dart';
import '../datasources/items_api_servic.dart';

@LazySingleton(as: ItemsRepository)
class ItemsRepositoryImpl extends ItemsRepository {
  final ItemsApiService2 _itemsApiService;
  final NetworkInfo _networkInfo;

  ItemsRepositoryImpl(this._itemsApiService, this._networkInfo);

  @override
  Future<Either<Failure, List<InstitutionItem>>> getItems() async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final items = await _itemsApiService.getItems();
      return Right(items);
    } catch (e) {
     rethrow;
    }
  }
}
