import 'package:dartz/dartz.dart';
import 'package:root_package/core/failures/failure.dart';

import '../../../../core/params/settings/add_email_params.dart';
import '../../../../core/params/settings/update_email_params.dart';
import '../../../../core/params/settings/update_phone_params.dart';
import '../../../../core/params/settings/update_profile_params.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> updateProfile(UpdateProfileParams params);
  Future<Either<Failure, void>> updatePhone(UpdatePhoneNumberParams params);
  Future<Either<Failure, void>> linkEmailAndPassword(
      LinkEmailAndPasswordParams params);
  Future<Either<Failure, void>> updateEmail(UpdateEmailParams params);
}
