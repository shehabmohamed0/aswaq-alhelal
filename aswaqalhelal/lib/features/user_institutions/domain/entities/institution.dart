import 'package:json_annotation/json_annotation.dart';
import 'package:root_package/packages/equatable.dart';

class Institution extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  @JsonKey()
  final String userId;
  @JsonKey()
  final String officialName;
  @JsonKey()
  final String commercialName;
  @JsonKey()
  final String brandName;
  @JsonKey()
  final String nickname;
  @JsonKey()
  final List<String> emails;
  @JsonKey()
  final List<String> phoneNumbers;

  const Institution({
    required this.id,
    required this.userId,
    required this.officialName,
    required this.commercialName,
    required this.brandName,
    required this.nickname,
    required this.emails,
    required this.phoneNumbers,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        officialName,
        commercialName,
        brandName,
        nickname,
        emails,
        phoneNumbers
      ];
}
