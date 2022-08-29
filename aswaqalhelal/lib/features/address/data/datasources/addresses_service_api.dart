import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/firebase_auth.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../../../../core/params/addresses/add_address_params.dart';
import '../../../../core/params/addresses/delete_address_params.dart';
import '../../../../core/params/addresses/update_address_params.dart';
import '../models/address_model.dart';

abstract class AddressesServiceApi {
  Future<AddressModel> addAddress(AddAddressParams params);
  Future<String> removeAddress(RemoveAddressParams params);
  Future<AddressModel> updateAddress(UpdateAddressParams params);
  Future<List<AddressModel>> getAddresses();

  Future<AddressModel> addFirstAddress(AddAddressParams params);
}

@LazySingleton(as: AddressesServiceApi)
class AddressesServiceApiImpl extends AddressesServiceApi {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  AddressesServiceApiImpl(this._firebaseAuth, this._firestore);
  @override
  Future<AddressModel> addAddress(AddAddressParams params) async {
    final user = _firebaseAuth.currentUser!;
    final addressesCollection =
        _firestore.collection(FirebasePath.userAddresses(user.uid));
    final ref = addressesCollection.doc();
    final model = params.toModel(ref.id);
    final modelJson = model.toJson();
    modelJson['saveTime'] = FieldValue.serverTimestamp();
    await ref.set(modelJson);

    return model;
  }

  @override
  Future<List<AddressModel>> getAddresses() async {
    final user = _firebaseAuth.currentUser!;
    final addressesCollection =
        _firestore.collection(FirebasePath.userAddresses(user.uid));
    final snapshot = await addressesCollection.orderBy('saveTime').get();
    final addresses = snapshot.docs.map(AddressModel.fromFirestore).toList();
    return addresses;
  }

  @override
  Future<String> removeAddress(RemoveAddressParams params) async {
    final user = _firebaseAuth.currentUser!;
    final addressDoc =
        _firestore.doc(FirebasePath.userAddress(user.uid, params.addressId));

    await addressDoc.delete();
    return params.addressId;
  }

  @override
  Future<AddressModel> updateAddress(UpdateAddressParams params) async {
    final user = _firebaseAuth.currentUser!;
    final addressDoc =
        _firestore.doc(FirebasePath.userAddress(user.uid, params.id));

    final model = params.toModel;

    await addressDoc.update(model.toJson());
    return model;
  }

  @override
  Future<AddressModel> addFirstAddress(AddAddressParams params) async {
    final user = _firebaseAuth.currentUser!;
    final userRef = _firestore.doc('users/${user.uid}');
    final addressesCollection =
        _firestore.collection(FirebasePath.userAddresses(user.uid));
    final ref = addressesCollection.doc();
    final batch = _firestore.batch();
    final model = params.toModel(ref.id);
    final modelJson = model.toJson();
    modelJson['saveTime'] = FieldValue.serverTimestamp();
    batch.set(ref, modelJson);
    batch.update(userRef, {'address': modelJson});

    await batch.commit();
    return model;
  }
}
