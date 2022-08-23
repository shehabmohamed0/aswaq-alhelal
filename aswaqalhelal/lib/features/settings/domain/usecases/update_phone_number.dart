import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';

import '../../../../core/params/settings/update_phone_params.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class UpdatePhoneNumber extends UseCase<void, UpdatePhoneNumberParams> {
  final ProfileRepository _profileRepository;
  UpdatePhoneNumber(this._profileRepository);
  @override
  Future<Either<Failure, void>> call({required UpdatePhoneNumberParams params}) {
    return _profileRepository.updatePhone(params);
  }
}
