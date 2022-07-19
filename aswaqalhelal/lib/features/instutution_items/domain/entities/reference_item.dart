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
    required String imageUrl,
    required List<Unit> units,
    required DateTime creationTime,
  }) : super(
            institutionId: institutionId,
            imageUrl: imageUrl,
            name: name,
            units: units,
            creationTime: creationTime);

  @override
  List<Object?> get props => [id, name, institutionId, units, creationTime];
}
