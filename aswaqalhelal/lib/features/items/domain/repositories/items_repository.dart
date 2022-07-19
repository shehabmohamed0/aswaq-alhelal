import 'package:root_package/root_package.dart';

import '../../../instutution_items/domain/entities/institution_item.dart';

abstract class ItemsRepository {
  Future<Either<Failure, List<InstitutionItem>>> getItems();
}
