import 'package:json_annotation/json_annotation.dart';

import 'base_item.dart';
import 'unit.dart';

class InstitutionItem extends BaseItem {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final String referenceId;

  const InstitutionItem({
    required this.id,
    required this.referenceId,
    required String institutionId,
    required String name,
    required List<Unit> units,
    required DateTime creationTime,
  }) : super(
          institutionId: institutionId,
          name: name,
          creationTime: creationTime,
          units: units,
        );

  @override
  List<Object?> get props =>
      [id, name, institutionId, referenceId, units, creationTime];
}
