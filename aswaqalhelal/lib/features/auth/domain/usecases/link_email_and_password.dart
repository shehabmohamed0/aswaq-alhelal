import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/params/auth/link_email_and_password_params.dart';
import '../../../../core/params/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class LinkEmailAndPassword extends UseCase<void, LinkEmailAndPasswordParams> {
  final AuthRepository _authRepository;
  LinkEmailAndPassword(this._authRepository);
  @override
  Future<Either<Failure, void>> call(
      {required LinkEmailAndPasswordParams params}) {
    return _authRepository.linkeEmailAndPassword(params);
  }
}
