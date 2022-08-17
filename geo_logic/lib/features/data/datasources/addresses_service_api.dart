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
    final ref = addressesCollection.doc();
    final model = params.toModel(ref.id);
    final modelJson = model.toJson();
    modelJson['saveTime'] = FieldValue.serverTimestamp();
    await ref.set(modelJson);

    return model;
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
    final addressDoc =
        firestore.doc(FirebasePath.userAddress(user.uid, params.id));

    final model = params.toModel;

    await addressDoc.update(model.toJson());
    return model;
  }

  @override
  Future<CountryModel> getCountry() {
    final countryModel = CountryModel.fromJson(country);
    return Future.value(countryModel);
  }
}
