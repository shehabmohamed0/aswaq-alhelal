import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/root_package.dart' show UseCase, Failure;

import '../../../../core/params/auth/sign_in_params.dart';
import '../repositories/auth_repository.dart';

@LazySingleton()
class SignInWithEmailAndPassword implements UseCase<void, SignInParams> {
  final AuthRepository repository;
  SignInWithEmailAndPassword(this.repository);

  @override
  Future<Either<Failure, void>> call({required SignInParams params}) {
    return repository.signInWithEmailAndPassword(params);
  }
}
