import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../features/auth/data/models/user/user_model.dart';

extension UserExtention on auth.User? {
  UserModel toUserModel() {
    final user = this;
    if (user != null) {
      return UserModel(
          id: user.uid,
          name: user.displayName,
          email: user.email,
          photoURL: user.photoURL,
          phoneNumber: user.phoneNumber ?? '',
          addressModel: null);
    } else {
      return UserModel.empty;
    }
  }
}
