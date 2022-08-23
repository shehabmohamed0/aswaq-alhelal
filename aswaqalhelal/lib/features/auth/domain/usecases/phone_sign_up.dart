import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/root_package.dart'
    show UseCase, Failure;

import '../../../../core/params/auth/phone_sign_up_params.dart';
import '../repositories/auth_repository.dart';
@lazySingleton
class PhoneSignUp implements UseCase<void, PhoneSignUpParams> {
  final AuthRepository authRepository;

  PhoneSignUp(this.authRepository);
  @override
  Future<Either<Failure, void>> call({required PhoneSignUpParams params}) {
    return authRepository.phoneSignUp(params);
  }
}
