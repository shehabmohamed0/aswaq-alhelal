import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:root_package/core/failures/failures.dart';
import 'package:root_package/core/services/network_info.dart';

import '../../../../core/failures/settings/update_email_failure.dart';
import '../../../../core/failures/settings/update_phone_number_failure.dart';
import '../../../../core/params/settings/add_email_params.dart';
import '../../../../core/params/settings/update_email_params.dart';
import '../../../../core/params/settings/update_phone_params.dart';
import '../../../../core/params/settings/update_profile_params.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_api_service.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApiService _profileApiService;
  final NetworkInfo _networkInfo;
  ProfileRepositoryImpl(this._profileApiService, this._networkInfo);

  @override
  Future<Either<Failure, void>> updateProfile(
      UpdateProfileParams params) async {
    try {
      if (!await _networkInfo.isConnected) {
        return Left(ServerFailure.internetConnection());
      }
      await _profileApiService.updateProfile(
        name: params.name,
        birthDate: params.birthDate,
        gender: params.gender,
      );

      return const Right(null);
    } on FirebaseException catch (e) {
      log(e.code);
      return Left(FirestoreFailure());
    } on Exception catch (e) {
      log('${e.runtimeType}');
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, void>> updatePhone(
      UpdatePhoneNumberParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      await _profileApiService.updatePhoneNumber(
          params.phoneNumber, params.phoneCredential);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      log(e.code);
      return Left(UpdatePhoneNumberFailure.fromCode(e.code));
    } on FirebaseException catch (e) {
      log(e.code);
      return Left(FirestoreFailure());
    } on Exception {
      return Left(UpdatePhoneNumberFailure());
    }
  }

  @override
  Future<Either<Failure, void>> linkEmailAndPassword(
      LinkEmailAndPasswordParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      await _profileApiService.linkEmailAndPassword(
          params.email, params.password);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      log(e.code);
      return Left(UpdatePhoneNumberFailure.fromCode(e.code));
    } on FirebaseException catch (e) {
      log(e.code);
      return Left(FirestoreFailure());
    } on Exception {
      return Left(UpdatePhoneNumberFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateEmail(UpdateEmailParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      await _profileApiService.updateEmail(
          params.newEmail, params.currentEmail, params.currentPassword);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      log(e.code);
      return Left(UpdateEmailFailure.fromCode(e.code));
    } on FirebaseException {
      return Left(FirestoreFailure());
    } on Exception {
      return Left(UpdatePhoneNumberFailure());
    }
  }
}
