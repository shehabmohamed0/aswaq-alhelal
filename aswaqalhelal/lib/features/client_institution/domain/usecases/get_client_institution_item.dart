import 'package:dartz/dartz.dart';
import 'package:aswaqalhelal/core/failures/failure.dart';

import 'package:aswaqalhelal/core/params/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/domain/entities/institution_profile.dart';
import '../../../institution_items/domain/entities/institution_item.dart';
import '../repositories/client_institution_repository.dart';

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
  final InstitutionProfile institution;

  GetClientInstitutionItemsParams(this.institution);
}
