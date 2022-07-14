import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/root_package.dart' show UseCase, Failure;

import '../../../../core/params/auth/phone_exists_params.dart';
import '../repositories/auth_repository.dart';

@injectable
class IsPhoneExistsUsecase extends UseCase<bool, PhoneExistsParams> {
  IsPhoneExistsUsecase(this._authRepository);
  final AuthRepository _authRepository;
  @override
  Future<Either<Failure, bool>> call({required PhoneExistsParams params}) {
    return _authRepository.isPhoneNumberExists(params);
  }
}
