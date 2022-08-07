import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/firebase_auth.dart';
import 'package:root_package/packages/injectable.dart';
import 'package:geo_logic/core/data.dart';
import '../../../../core/firebase/firebase_path.dart';
import '../../../../core/params/addresses/add_address_params.dart';
import '../../../../core/params/addresses/delete_address_params.dart';
import '../../../../core/params/addresses/update_address_params.dart';
import '../models/address_model.dart';
import '../models/country_model.dart';
import '../models/geo_point_model.dart';

abstract class AddressesServiceApi {
  Future<AddressModel> addAddress(AddAddressParams params);
  Future<String> removeAddress(RemoveAddressParams params);
  Future<AddressModel> updateAddress(UpdateAddressParams params);
  Future<List<AddressModel>> getAddresses();
  Future<CountryModel> getCountry();
}

@LazySingleton(as: AddressesServiceApi)
class AddressesServiceApiImpl extends AddressesServiceApi {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  AddressesServiceApiImpl(this.firebaseAuth, this.firestore);
  @override
  Future<AddressModel> addAddress(AddAddressParams params) async {
    final user = firebaseAuth.currentUser!;
    final addressesCollection =
        firestore.collection(FirebasePath.userAddresses(user.uid));

    final ref = await addressesCollection.add({
      'country': params.country,
      'governate': params.governate,
      'city': params.city,
      'neighborhood': params.neighborhood,
      'description': params.description,
      'geoPoint': {'lat': params.geoPoint.lat, 'long': params.geoPoint.long},
      'saveTime': FieldValue.serverTimestamp()
    });
    final address = AddressModel(
        id: ref.id,
        country: params.country,
        governate: params.governate,
        city: params.city,
        neighborhood: params.neighborhood,
        description: params.description,
        geoPointModel: GeoPointModel(
            lat: params.geoPoint.lat, long: params.geoPoint.long));
    return address;
  }

  @override
  Future<List<AddressModel>> getAddresses() async {
    final user = firebaseAuth.currentUser!;
    final addressesCollection =
        firestore.collection(FirebasePath.userAddresses(user.uid));
    final snapshot = await addressesCollection.orderBy('saveTime').get();
    final addresses = snapshot.docs.map(AddressModel.fromFirestore).toList();
    return addresses;
  }

  @override
  Future<String> removeAddress(RemoveAddressParams params) async {
    final user = firebaseAuth.currentUser!;
    final addressDoc =
        firestore.doc(FirebasePath.userAddress(user.uid, params.addressId));

    await addressDoc.delete();
    return params.addressId;
  }

  @override
  Future<AddressModel> updateAddress(UpdateAddressParams params) async {
    final user = firebaseAuth.currentUser!;
    final addressDoc = firestore.doc(FirebasePath.userAddress(user.uid, params.id));
    await addressDoc.update({
      'country': params.country,
      'governate': params.governate,
      'city': params.city,
      'neighborhood': params.neighborhood,
      'description': params.description,
      'geoPoint': {'lat': params.geoPoint.lat, 'long': params.geoPoint.long},
    });
    return params.toAddressModel;
  }

  @override
  Future<CountryModel> getCountry() {
    final countryModel = CountryModel.fromJson(country);
    return Future.value(countryModel);
  }
}
