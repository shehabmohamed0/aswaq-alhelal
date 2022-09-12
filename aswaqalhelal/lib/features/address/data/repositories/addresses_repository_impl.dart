import 'dart:developer';

import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/core/failures/server_failure.dart';
import 'package:root_package/core/services/network_info.dart';
import 'package:root_package/packages/dartz.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/exceptions/address/location_exceptions.dart';
import '../../../../core/failures/address/location_failure.dart';
import '../../../../core/params/addresses/add_address_params.dart';
import '../../../../core/params/addresses/add_first_address_params.dart';
import '../../../../core/params/addresses/delete_address_params.dart';
import '../../../../core/params/addresses/update_address_params.dart';
import '../../domain/entities/address.dart';
import '../../domain/entities/geo_point.dart';
import '../../domain/repositories/addresses_repository.dart';
import '../datasources/address_local_data_source.dart';
import '../datasources/addresses_service_api.dart';
import '../models/address_model.dart';

@LazySingleton(as: AddressesRepository)
class AddressesRepositoryImpl extends AddressesRepository {
  final AddressesServiceApi _addressesServiceApi;
  final AddressesLocalDataSource _addressesLocalDataSource;
  final NetworkInfo _networkInfo;

  AddressesRepositoryImpl(this._addressesServiceApi, this._networkInfo,
      this._addressesLocalDataSource);

  @override
  Future<Either<Failure, AddressModel>> addAddress(
      AddAddressParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final address = await _addressesServiceApi.addAddress(params);
      return Right(address);
    } on Exception catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, List<Address>>> getAddresses() async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final addresses = await _addressesServiceApi.getAddresses();
      return Right(addresses);
    } on Exception catch (e) {
      log(e.toString());

      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, String>> removeAddress(
      RemoveAddressParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }
    try {
      final id = await _addressesServiceApi.removeAddress(params);
      return Right(id);
    } on Exception catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, Address>> updateAddress(
      UpdateAddressParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final address = await _addressesServiceApi.updateAddress(params);
      return Right(address);
    } on Exception catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, GeoPoint>> getCurrentLocation() async {
    try {
      final geo = await _addressesLocalDataSource.getCurrentLocation();
      return Right(geo);
    } on LocationDeniedException {
      return Left(LocationDeniedFailure());
    } on LocationDeniedForeverException {
      return Left(LocationDeniedForeverFailure(
          'Denied For ever, please go to settings'));
    } on Exception catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }

  @override
  Future<Either<Failure, Address>> addFirstAddress(
      AddFirstAddressParams params) async {
    if (!await _networkInfo.isConnected) {
      return Left(ServerFailure.internetConnection());
    }

    try {
      final address = await _addressesServiceApi.addFirstAddress(params);
      return Right(address);
    } on Exception catch (e) {
      log(e.toString());
      return Left(ServerFailure.general());
    }
  }
}
