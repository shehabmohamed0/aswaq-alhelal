import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/usecase/usecase.dart';

import '../../../../core/params/settings/update_profile_params.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class UpdateProfile extends UseCase<void, UpdateProfileParams> {
  final ProfileRepository _profileRepository;
  UpdateProfile(this._profileRepository);
  @override
  Future<Either<Failure, void>> call({required UpdateProfileParams params}) {
    return _profileRepository.updateProfile(params);
  }
}
