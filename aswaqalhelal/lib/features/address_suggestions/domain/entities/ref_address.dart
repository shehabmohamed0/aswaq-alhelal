import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

abstract class RefAddress extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  final String name;

  const RefAddress({
    required this.id,
    required this.name,
  });
}
