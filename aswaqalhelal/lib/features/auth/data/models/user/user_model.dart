import 'package:aswaqalhelal/features/auth/domain/entities/base_profile.dart';
import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/freezed_annotation.dart';

import '../../../domain/entities/user.dart';
part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.profiles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String? ?? '';
    final List<BaseProfile> profiles = json['profiles'] == null
        ? []
        : (json['profiles'] as Map<String, dynamic>)
            .entries
            .map((entry) => BaseProfile.fromJson(entry.value))
            .toList();

    return UserModel(id: id, profiles: profiles);
  }
  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final userModel = UserModel.fromJson(document.data()!);
    return userModel._copyWithId(document.id);
  }

  UserModel _copyWithId(String id) => UserModel(id: id, profiles: profiles);
  static const UserModel empty = UserModel(id: '', profiles: []);
}
