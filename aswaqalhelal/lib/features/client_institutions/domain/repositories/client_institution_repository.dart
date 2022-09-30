import 'package:root_package/root_package.dart';

import '../../../auth/domain/entities/institution_profile.dart';
import '../../../institution_items/domain/entities/institution_item.dart';

abstract class ClientInstitutionRepository {
  Future<Either<Failure, List<InstitutionItem>>> getClientInstitutionItems(
      InstitutionProfile institution);
}
