import 'dart:io';

import 'package:aswaqalhelal/features/institution_items/data/models/institution_item_model.dart';
import 'package:aswaqalhelal/features/institution_items/data/models/unit_model.dart';

import '../../../features/institution_items/domain/entities/institution_item.dart';
import '../../../features/institution_items/domain/entities/unit.dart';

class AddRefAndInstitutionItemParams {
  final String itemName;
  final File? imageFile;
  final List<Unit> units;
  final String institutionId;

  AddRefAndInstitutionItemParams({
    required this.itemName,
    required this.imageFile,
    required this.units,
    required this.institutionId,
  });

  InstitutionItemModel toModel(
          String id, String referenceId, String? imageUrl) =>
      InstitutionItemModel(
        id: id,
        institutionId: institutionId,
        referenceId: referenceId,
        name: itemName,
        imageUrl: imageUrl,
        creationTime: DateTime.now(),
        unitModels: units.map(UnitModel.fromDomain).toList(),
      );
}

class AddInstitutionItemParams {
  final String itemName;
  final File? imageFile;
  final List<Unit> units;
  final String? imageUrl;
  final String institutionId;
  final String referenceId;

  AddInstitutionItemParams({
    required this.itemName,
    required this.imageFile,
    required this.imageUrl,
    required this.units,
    required this.institutionId,
    required this.referenceId,
  });
}

class GetInstitutionItemsParams {
  final String institutionId;

  GetInstitutionItemsParams(this.institutionId);
}

class UpdateInstitutionItemParams {
  final InstitutionItem oldItem;

  final File? imageFile;
  final String? imageUrl;
  final List<Unit> units;

  UpdateInstitutionItemParams({
    required this.oldItem,
    required this.imageFile,
    required this.imageUrl,
    required this.units,
  });
}
