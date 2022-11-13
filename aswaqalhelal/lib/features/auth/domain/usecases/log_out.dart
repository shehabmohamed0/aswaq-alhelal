import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/params/no_args_params.dart';
import '../../../../core/params/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

@LazySingleton()
class LogOut implements UseCase<void, NoArgsParams> {
  final AuthRepository repository;
  LogOut(this.repository);

  @override
  Future<Either<Failure, void>> call({required NoArgsParams params}) {
    return repository.signOut();
  }
}
