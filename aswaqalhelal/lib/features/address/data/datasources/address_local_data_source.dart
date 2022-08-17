import 'package:root_package/packages/geolocator.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/exceptions/address/location_exceptions.dart';
import '../models/geo_point_model.dart';

abstract class AddressesLocalDataSource {
  Future<GeoPointModel> getCurrentLocation();
}

@LazySingleton(as: AddressesLocalDataSource)
class AddressesLocalDataSourceImpl implements AddressesLocalDataSource {
  
  AddressesLocalDataSourceImpl();

  @override
  Future<GeoPointModel> getCurrentLocation() async {
    LocationPermission permission;

  

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        throw LocationDeniedException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
             throw LocationDeniedForeverException();
    }
    final position = await Geolocator.getCurrentPosition();
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return GeoPointModel(lat: position.latitude, long: position.longitude);
  }
}
