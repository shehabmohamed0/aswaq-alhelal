import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';



@JsonSerializable()
class ResultResponse {
  ResultResponse(this.result);

  @JsonKey()
  double result;
  factory ResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);
}
