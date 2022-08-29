import 'package:root_package/core/failures/failure.dart';
import 'package:root_package/packages/dartz.dart';

import '../../../../core/params/addresses/add_address_params.dart';
import '../../../../core/params/addresses/delete_address_params.dart';
import '../../../../core/params/addresses/update_address_params.dart';
import '../entities/address.dart';
import '../entities/geo_point.dart';

abstract class AddressesRepository {
  Future<Either<Failure, Address>> addAddress(AddAddressParams params);
  Future<Either<Failure, List<Address>>> getAddresses();
  Future<Either<Failure, String>> removeAddress(RemoveAddressParams params);

  Future<Either<Failure, Address>> updateAddress(UpdateAddressParams params);

  Future<Either<Failure, GeoPoint>> getCurrentLocation();

  Future<Either<Failure, Address>> addFirstAddress(AddAddressParams params);
}
