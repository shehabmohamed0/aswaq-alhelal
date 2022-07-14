import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class User extends Equatable {
  @JsonKey(defaultValue: '')
  final String id;
  final String name;
  final String? email;
  final String? photoURL;
  final String phoneNumber;
  final DateTime? birthDate;
  final String? gender;

  const User(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      this.email,
      this.photoURL,
      this.birthDate,
      this.gender});

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? photoURL,
    String? phoneNumber,
    DateTime? birthDate,
    String? gender,
  }) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        photoURL: photoURL ?? this.photoURL,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender);
  }

  static const empty = User(id: '', name: '', phoneNumber: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => id.isEmpty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => id.isNotEmpty;

  @override
  List<Object?> get props =>
      [id, name, email, photoURL, phoneNumber, birthDate, gender];
}
