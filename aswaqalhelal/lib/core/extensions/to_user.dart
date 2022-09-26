import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../features/auth/data/models/user/user_profile_model.dart';
import '../../features/auth/domain/entities/base_profile.dart';

extension UserExtention on auth.User? {
  BaseProfile toUserModel() {
    final user = this;
    if (user != null) {
      return UserProfileModel(
          id: user.uid,
          userId: user.uid,
          name: user.displayName ?? '',
          email: user.email,
          photoURL: user.photoURL,
          phoneNumber: user.phoneNumber ?? '',
          type: ProfileType.user);
    } else {
      return BaseProfile.empty;
    }
  }
}
