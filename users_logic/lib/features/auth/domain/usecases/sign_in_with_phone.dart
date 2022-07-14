import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/root_package.dart' show UseCase, Failure;

import '../../../../core/params/auth/phone_sign_in_params.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class SignInWithPhone extends UseCase<void, PhoneSignInParams> {
  final AuthRepository authRepository;
  SignInWithPhone(this.authRepository);
  @override
  Future<Either<Failure, void>> call({required PhoneSignInParams params}) {
    return authRepository.signInWithPhone(params);
  }
}
