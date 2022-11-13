import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:timeago/timeago.dart' as timeago;

class FStoreNotificationItem extends Equatable {
  final String id;
  final String title;
  final String body;
  final bool seen;
  final Map? data;
  final DateTime creationTime;
  final DocumentSnapshot? snapshot;
  const FStoreNotificationItem({
    required this.id,
    required this.title,
    required this.body,
    this.data,
    this.seen = false,
    required this.creationTime,
    this.snapshot,
  });

  String get displayDate => timeago.format(creationTime);

  factory FStoreNotificationItem.fromJson(
      Map<String, dynamic> json, DocumentSnapshot snapshot) {
    return FStoreNotificationItem(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        seen: json['seen'] as bool? ?? false,
        data: json['data'] as Map<String, dynamic>,
        creationTime: (json['creationTime'] as Timestamp).toDate(),
        snapshot: snapshot);
  }

  FStoreNotificationItem copyWith({
    String? id,
    String? title,
    String? body,
    bool? seen,
    Map? data,
    DateTime? creationTime,
  }) {
    return FStoreNotificationItem(
        id: id ?? this.id,
        title: title ?? this.title,
        seen: seen ?? this.seen,
        body: body ?? this.body,
        data: Map<String, dynamic>.from(
            jsonDecode(jsonEncode(data ?? this.data ?? {}))),
        creationTime: creationTime ?? this.creationTime,
        snapshot: snapshot);
  }

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', id);
    writeNotNull('title', title);
    writeNotNull('body', body);
    writeNotNull('seen', seen);
    writeNotNull('data', data);
    writeNotNull('creationTime', creationTime.toString());
    return val;
  }

  @override
  List<Object?> get props => [id, title, body, seen, data, creationTime];
}
