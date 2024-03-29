
import 'package:aswaqalhelal/core/params/addresses/add_first_address_params.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

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

  Future<AddressModel> addFirstAddress(AddFirstAddressParams params);

  Future<AddressModel> updateMainAddress(UpdateAddressParams params);
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
        _firestore.collection(FirestorePath.userAddresses(user.uid));
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
        _firestore.collection(FirestorePath.userAddresses(user.uid));
    final snapshot = await addressesCollection.orderBy('saveTime').get();
    final addresses = snapshot.docs.map(AddressModel.fromFirestore).toList();
    return addresses;
  }

  @override
  Future<String> removeAddress(RemoveAddressParams params) async {
    final user = _firebaseAuth.currentUser!;
    final addressDoc =
        _firestore.doc(FirestorePath.userAddress(user.uid, params.addressId));

    await addressDoc.delete();
    return params.addressId;
  }

  @override
  Future<AddressModel> updateAddress(UpdateAddressParams params) async {
    final user = _firebaseAuth.currentUser!;
    final addressDoc =
        _firestore.doc(FirestorePath.userAddress(user.uid, params.id));

    final model = params.toModel;

    await addressDoc.update(model.toJson());
    return model;
  }

  @override
  Future<AddressModel> addFirstAddress(AddFirstAddressParams params) async {
    final user = _firebaseAuth.currentUser!;
    // final userRef = _firestore.doc('users/${user.uid}');
    final profileRef = _firestore.doc(FirestorePath.profile(user.uid));
    final addressesCollection =
        _firestore.collection(FirestorePath.userAddresses(user.uid));
    final ref = addressesCollection.doc();
    final batch = _firestore.batch();
    final model = params.addressParams.toModel(ref.id);
    final modelJson = model.toJson();
    modelJson['saveTime'] = FieldValue.serverTimestamp();
    batch.set(ref, modelJson);
    batch.update(profileRef, {'address': modelJson, 'name': params.name});
    // batch.update(
    //   userRef,
    //   {
    //     'profiles.${user.uid}.address': modelJson,
    //     'profiles.${user.uid}.name': params.name,
    //   },
    // );

    await batch.commit();
    return model;
  }

  @override
  Future<AddressModel> updateMainAddress(UpdateAddressParams params) async {
    final user = _firebaseAuth.currentUser!;
    final batch = _firestore.batch();

    final addressDoc =
        _firestore.doc(FirestorePath.userAddress(user.uid, params.id));
    final userDoc = _firestore.doc(FirestorePath.user(user.uid));
    final model = params.toModel;
    batch.update(addressDoc, model.toJson());

    batch.update(userDoc, {
      'profiles.${user.uid}.address': model.toJson(),
    });
    await batch.commit();
    return model;
  }
}
