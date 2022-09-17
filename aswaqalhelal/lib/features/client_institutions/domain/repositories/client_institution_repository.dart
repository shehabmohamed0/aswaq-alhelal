import 'package:aswaqalhelal/features/institution_items/domain/entities/institution_item.dart';
import 'package:aswaqalhelal/features/user_institutions/domain/entities/institution.dart';
import 'package:root_package/root_package.dart';

abstract class ClientInstitutionRepository {
  Future<Either<Failure, List<InstitutionItem>>> getClientInstitutionItems(
      Institution institution);
}
