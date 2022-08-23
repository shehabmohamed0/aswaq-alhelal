import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/root_package.dart'
    show UseCase, Failure, NoArgsParams;
import '../repositories/auth_repository.dart';

@LazySingleton()
class SignInWithFacebook implements UseCase<void, NoArgsParams> {
  final AuthRepository repository;
  SignInWithFacebook(this.repository);

  @override
  Future<Either<Failure, void>> call({required NoArgsParams params}) {
    return repository.signInWithFacebook();
  }
}
