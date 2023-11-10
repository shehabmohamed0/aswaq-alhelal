import 'package:dartz/dartz.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/params/auth/link_email_and_password_params.dart';
import '../../../../core/params/auth/phone_sign_in_params.dart';
import '../../../../core/params/auth/verify_phone_params.dart';
import '../entities/base_profile.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signInWithPhone(PhoneSignInParams params);
  Future<Either<Failure, void>> verifyPhone(VerifyPhoneParams params);
  Future<Either<Failure, void>> linkeEmailAndPassword(
      LinkEmailAndPasswordParams params);
  Future<Either<Failure, void>> saveLastProfile(BaseProfile baseProfile);
  Future<Either<Failure, String>> getLastProfile();
  Stream<User> get user;
  Future<Either<Failure, void>> signOut();
}
