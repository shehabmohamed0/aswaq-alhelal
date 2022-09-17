import 'package:aswaqalhelal/features/client_institutions/domain/repositories/client_institution_repository.dart';
import 'package:aswaqalhelal/features/institution_items/domain/entities/institution_item.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:root_package/core/usecase/usecase.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../user_institutions/domain/entities/institution.dart';
@lazySingleton
class GetClientInstitutionItems
    extends UseCase<List<InstitutionItem>, GetClientInstitutionItemsParams> {

      final ClientInstitutionRepository _repository;

  GetClientInstitutionItems(this._repository);
  @override
  Future<Either<Failure, List<InstitutionItem>>> call(
      {required GetClientInstitutionItemsParams params}) {
    return _repository.getClientInstitutionItems(params.institution);
  }
}

class GetClientInstitutionItemsParams {
  final Institution institution;

  GetClientInstitutionItemsParams(this.institution);
}
