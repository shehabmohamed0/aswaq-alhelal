import 'package:json_annotation/json_annotation.dart';

import 'base_item.dart';
import 'unit.dart';

class ReferenceItem extends BaseItem {
  @JsonKey(defaultValue: '')
  final String id;

  const ReferenceItem({
    required this.id,
    required String institutionId,
    required String name,
    required List<Unit> units,
  }) : super(institutionId: institutionId, name: name, units: units);

  @override
  List<Object?> get props => [id, name, institutionId, units];

  @override
  bool? get stringify => true;
}
