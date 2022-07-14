import 'package:root_package/root_package.dart';

import '../../../../core/params/add_item/params.dart';
import '../entities/institution_item.dart';
import '../entities/reference_item.dart';

abstract class ItemsRepository {
  Future<Either<Failure, List<ReferenceItem>>> searchItem(String value);

  Future<Either<Failure, InstitutionItem>> addInstitutionItem(
      AddInstitutionItemParams params);

  Future<Either<Failure, InstitutionItem>> addRefAndInstitutionItem(
      AddRefAndInstitutionItemParams params);

  Future<Either<Failure, List<InstitutionItem>>> getInstitutionItems(
      GetInstitutionItemsParams params);
}
