import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/root_package.dart'
    show UseCase, Failure;

import '../../../../core/params/auth/verify_phone_params.dart';
import '../repositories/auth_repository.dart';
@lazySingleton
class VerifyPhoneNumber extends UseCase<void, VerifyPhoneParams> {
  final AuthRepository _authRepository;
  VerifyPhoneNumber(this._authRepository);
  @override
  Future<Either<Failure, void>> call({required VerifyPhoneParams params}) {
    return _authRepository.verifyPhone(params);
  }
}
