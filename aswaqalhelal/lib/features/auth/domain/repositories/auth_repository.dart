import 'package:root_package/root_package.dart';

import '../../../../core/params/auth/link_email_and_password_params.dart';
import '../../../../core/params/auth/phone_exists_params.dart';
import '../../../../core/params/auth/phone_sign_in_params.dart';
import '../../../../core/params/auth/phone_sign_up_params.dart';
import '../../../../core/params/auth/sign_in_params.dart';
import '../../../../core/params/auth/verify_phone_params.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> signInWithEmailAndPassword(SignInParams params);
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> signInWithPhone(PhoneSignInParams params);
  Future<Either<Failure, void>> phoneSignUp(PhoneSignUpParams params);
  Future<Either<Failure, void>> signInWithFacebook();
  Future<Either<Failure, void>> verifyPhone(VerifyPhoneParams params);
  Future<Either<Failure, void>> linkeEmailAndPassword(
      LinkEmailAndPasswordParams params);
  Future<Either<Failure, bool>> isPhoneNumberExists(PhoneExistsParams params);
  User get currentUser;
  Stream<User> get user;
  Future<Either<Failure, void>> signOut();
}
