import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:injectable/injectable.dart';

import 'package:aswaqalhelal/core/failures/failure.dart';
import 'package:aswaqalhelal/core/failures/server_failure.dart';
import 'package:aswaqalhelal/core/params/services/network_info.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/failures/auth/link_email_and_password_failure.dart';
import '../../../../core/failures/auth/phone_credential_failure.dart';
import '../../../../core/failures/auth/reauthenticate_user_failure.dart';
import '../../../../core/failures/cache_failure.dart';
import '../../../../core/params/auth/link_email_and_password_params.dart';
import '../../../../core/params/auth/phone_sign_in_params.dart';
import '../../../../core/params/auth/verify_phone_params.dart';
import '../../domain/entities/base_profile.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_service.dart';
import '../datasources/remote/auth_api_service.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthApiService authApiService;
  AuthLocalService authLocalService;
  NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.authApiService,
      required this.authLocalService,
      required this.networkInfo});

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await authApiService.signOut();
      return const Right(null);
    } on Exception catch (e) {
      log(e.toString());
      return Left(CacheFailure());
    }
  }

  @override
  Stream<User> get user => authApiService.user;

  @override
  Future<Either<Failure, void>> signInWithPhone(
      PhoneSignInParams params) async {
    if (!await networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      await authApiService.signInWithPhoneCredential(
          params.phoneNumber, params.phoneAuthCredential);

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      log(e.code);
      return Left(PhoneCredentialFailure.fromCode(e.code));
    } on Exception catch (e) {
      log(e.toString());
      return Left(PhoneCredentialFailure());
    }
  }

  @override
  Future<Either<Failure, void>> verifyPhone(VerifyPhoneParams params) async {
    if (!await networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      await authApiService.verifyPhone(
        phoneNumber: params.phoneNumber,
        verificationCompleted: params.verificationCompleted,
        verificationFailed: params.verificationFailed,
        codeSent: params.codeSent,
        codeAutoRetrievalTimeout: params.codeAutoRetrievalTimeout,
      );

      return const Right(null);
    } on FirebaseAuthException catch (e) {
      log(e.code);
      return Left(ServerFailure.general());
    } on Exception catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, void>> linkeEmailAndPassword(
      LinkEmailAndPasswordParams params) async {
    try {
      await authApiService.linkEmailAndPassword(params.email, params.password);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return Left(ReAuthenticateUserFailure());
      }
      return Left(LinkEmailAndPasswordFailure.fromCode(e.code));
    } on Exception catch (e) {
      log(e.toString());
      return Left(LinkEmailAndPasswordFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveLastProfile(BaseProfile baseProfile) async {
    try {
      await authLocalService.saveCurrentProfile(baseProfile);
      return const Right(null);
    } catch (e) {
      return Future.value(Left(CacheFailure()));
    }
  }

  @override
  Future<Either<Failure, String>> getLastProfile() {
    try {
      final profile = authLocalService.lastSelectedProfile();
      return Future.value(Right(profile));
    } catch (e) {
      log(e.toString());
      return Future.value(Left(CacheFailure()));
    }
  }
}
