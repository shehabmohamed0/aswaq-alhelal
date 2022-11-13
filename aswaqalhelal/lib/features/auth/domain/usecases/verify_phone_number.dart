import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/params/auth/verify_phone_params.dart';
import '../../../../core/params/usecase/usecase.dart';
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
