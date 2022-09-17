import 'package:root_package/root_package.dart';

import '../../../institution_items/domain/entities/institution_item.dart';

abstract class ItemsRepository {
  Future<Either<Failure, List<InstitutionItem>>> getItems();
}
