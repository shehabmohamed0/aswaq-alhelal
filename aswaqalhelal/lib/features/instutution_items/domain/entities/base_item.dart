import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

import 'unit.dart';

abstract class BaseItem implements Equatable {
  @JsonKey()
  final String institutionId;
  @JsonKey()
  final String name;
  @JsonKey()
  final List<Unit> units;

  const BaseItem({
    required this.institutionId,
    required this.name,
    required this.units,
  });
}
