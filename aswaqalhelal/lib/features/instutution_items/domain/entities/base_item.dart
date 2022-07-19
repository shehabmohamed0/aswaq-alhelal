import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';
import 'package:root_package/json_converters/time_stamp_converter.dart';
import 'unit.dart';

abstract class BaseItem extends Equatable {
  @JsonKey()
  final String institutionId;
  @JsonKey()
  final String name;
  @JsonKey()
  final String imageUrl;
  @JsonKey()
  final List<Unit> units;
  @TimestampConverter()
  final DateTime creationTime;
  const BaseItem({
    required this.institutionId,
    required this.name,
    required this.imageUrl,
    required this.units,
    required this.creationTime,
  });
}
