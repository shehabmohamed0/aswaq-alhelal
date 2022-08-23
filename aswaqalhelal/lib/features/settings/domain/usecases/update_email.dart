import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';

import '../../../../core/params/settings/update_email_params.dart';
import '../repositories/profile_repository.dart';
@lazySingleton
class UpdateEmail extends UseCase<void, UpdateEmailParams> {
  final ProfileRepository repository;
  UpdateEmail(this.repository);
  @override
  Future<Either<Failure, void>> call({required UpdateEmailParams params}) {

      return repository.updateEmail(params);
  }
}
