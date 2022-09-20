// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) => ReceiptModel(
      id: json['id'] as String? ?? '',
      from: json['from'] as String,
      to: json['to'] as String?,
      itemsModels: (json['items'] as List<dynamic>)
          .map((e) => ReceiptItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      employeeId: json['employeeId'] as String,
      creationTime: const TimestampConverter()
          .fromJson(json['creationTime'] as Timestamp),
    );

Map<String, dynamic> _$ReceiptModelToJson(ReceiptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'to': instance.to,
      'totalPrice': instance.totalPrice,
      'creationTime': const TimestampConverter().toJson(instance.creationTime),
      'employeeId': instance.employeeId,
      'items': instance.itemsModels.map((e) => e.toJson()).toList(),
    };
