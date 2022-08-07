import 'package:geo_logic/features/domain/entities/address.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/json_converters/time_stamp_converter.dart';
import 'package:root_package/packages/equatable.dart';

class Institution extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final String userId;
  @JsonKey()
  final String officialName;
  @JsonKey()
  final String nickName;
  @JsonKey()
  final List<String> emails;
  @JsonKey()
  final List<String> phoneNumbers;
  @TimestampConverter()
  final DateTime creationTime;

  final Address address;
  const Institution({
    required this.id,
    required this.userId,
    required this.officialName,
    required this.nickName,
    required this.emails,
    required this.phoneNumbers,
    required this.address,
    required this.creationTime,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        officialName,
        nickName,
        emails,
        phoneNumbers,
        address,
        creationTime
      ];
}
