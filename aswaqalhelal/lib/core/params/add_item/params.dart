import '../../../features/instutution_items/domain/entities/unit.dart';

class AddRefAndInstitutionItemParams {
  final String itemName;
  final List<Unit> units;
  final String institutionId;

  AddRefAndInstitutionItemParams({
    required this.itemName,
    required this.units,
    required this.institutionId,
  });
}

class AddInstitutionItemParams {
  final String itemName;
  final List<Unit> units;
  final String institutionId;
  final String referenceId;

  AddInstitutionItemParams({
    required this.itemName,
    required this.units,
    required this.institutionId,
    required this.referenceId,
  });
}

class GetInstitutionItemsParams {
  final String institutionId;

  GetInstitutionItemsParams(this.institutionId);
}
