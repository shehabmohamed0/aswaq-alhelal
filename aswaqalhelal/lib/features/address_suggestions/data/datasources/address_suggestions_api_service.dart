import 'dart:developer';

import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/firebase/firebase_path.dart';
import '../../../../core/params/address_suggestion/params.dart';
import '../models/models.dart';

typedef QuerySnapshotFuture = Future<QuerySnapshot<Map<String, dynamic>>>;
typedef FirestoreCollectionRef = CollectionReference<Map<String, dynamic>>;

abstract class AddressSuggestionsApiService {
  Future<List<RefGovernateModel>> getGovernateSuggestions(
      GetGovernatesSuggestionsParams params);
  Future<List<RefCityModel>> getCitiesSuggestions(
      GetCitiesSuggestionsParams params);
  Future<List<RefNeighborhoodModel>> getNeighborhoodsSuggestions(
      GetNeighborhoodsSuggestionsParams params);

  Future<RefGovernateModel> addNewGovernate(AddNewGovernateParams params);
  Future<RefCityModel> addNewCity(AddNewCityParams params);
  Future<RefNeighborhoodModel> addNewNeighborhood(
      AddNewNeighborhoodParams params);
}

@LazySingleton(as: AddressSuggestionsApiService)
class AddressSuggestionsApiServiceImpl implements AddressSuggestionsApiService {
  final FirebaseFirestore _firestore;

  AddressSuggestionsApiServiceImpl(this._firestore);

  @override
  Future<List<RefGovernateModel>> getGovernateSuggestions(
      GetGovernatesSuggestionsParams params) async {
    final collection = _firestore.collection(FirestorePath.refGovernates);
    log(params.country);
    log(params.searchText);
    final snapshot = await collection
        .where('country', isEqualTo: params.country)
        .where('searchText', isGreaterThanOrEqualTo: params.searchText)
        .where('searchText', isLessThanOrEqualTo: params.searchText + "\uf8ff")
        .orderBy('searchText')
        .get();

    final suggestions =
        snapshot.docs.map(RefGovernateModel.fromFirestore).toList();
    return suggestions;
  }

  @override
  Future<List<RefCityModel>> getCitiesSuggestions(
      GetCitiesSuggestionsParams params) async {
    final collection = _firestore.collection(FirestorePath.refCities);
    final snapshot = await collection
        .where('country', isEqualTo: params.country)
        .where('governate', isEqualTo: params.governate)
        .where('searchText', isGreaterThanOrEqualTo: params.searchText)
        .where('searchText', isLessThanOrEqualTo: params.searchText + "\uf8ff")
        .orderBy('searchText')
        .get();

    final suggestions = snapshot.docs.map(RefCityModel.fromFirestore).toList();
    return suggestions;
  }

  @override
  Future<List<RefNeighborhoodModel>> getNeighborhoodsSuggestions(
      GetNeighborhoodsSuggestionsParams params) async {
    final collection = _firestore.collection(FirestorePath.refNeighborhoods);
    final snapshot = await collection
        .where('country', isEqualTo: params.country)
        .where('governate', isEqualTo: params.governate)
        .where('city', isEqualTo: params.city)
        .where('searchText', isGreaterThanOrEqualTo: params.searchText)
        .where('searchText', isLessThanOrEqualTo: params.searchText + "\uf8ff")
        .orderBy('searchText')
        .get();

    final suggestions =
        snapshot.docs.map(RefNeighborhoodModel.fromFirestore).toList();
    return suggestions;
  }

  @override
  Future<RefGovernateModel> addNewGovernate(
      AddNewGovernateParams params) async {
    final collection = _firestore.collection(FirestorePath.refGovernates);

    final snapshot = await collection
        .where('country', isEqualTo: params.country)
        .where('searchText', isEqualTo: params.searchText)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return RefGovernateModel.fromFirestore(snapshot.docs.first);
    } else {
      final doc = collection.doc();

      final mapData = {
        'country': params.country,
        'name': params.governate,
        'searchText': params.searchText,
      };
      await doc.set(mapData);
      return RefGovernateModel.fromJson(
          mapData..putIfAbsent('id', () => doc.id));
    }
  }

  @override
  Future<RefCityModel> addNewCity(AddNewCityParams params) async {
    final collection = _firestore.collection(FirestorePath.refCities);

    final snapshot = await collection
        .where('country', isEqualTo: params.country)
        .where('governate', isEqualTo: params.refGovernate.name)
        .where('searchText', isEqualTo: params.searchText)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return RefCityModel.fromFirestore(snapshot.docs.first);
    } else {
      final doc = collection.doc();

      final mapData = {
        'country': params.country,
        'governate': params.refGovernate.name,
        'name': params.city,
        'searchText': params.searchText,
      };
      await doc.set(mapData);
      return RefCityModel.fromJson(mapData..putIfAbsent('id', () => doc.id));
    }
  }

  @override
  Future<RefNeighborhoodModel> addNewNeighborhood(
      AddNewNeighborhoodParams params) async {
    final collection = _firestore.collection(FirestorePath.refNeighborhoods);

    final snapshot = await collection
        .where('country', isEqualTo: params.country)
        .where('governate', isEqualTo: params.refGovernate.name)
        .where('city', isEqualTo: params.refCity.name)
        .where('searchText', isEqualTo: params.searchText)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return RefNeighborhoodModel.fromFirestore(snapshot.docs.first);
    } else {
      final doc = collection.doc();

      final mapData = {
        'country': params.country,
        'governate': params.refGovernate.name,
        'city': params.refCity.name,
        'name': params.neighborhood,
        'searchText': params.searchText,
      };
      await doc.set(mapData);
      return RefNeighborhoodModel.fromJson(
          mapData..putIfAbsent('id', () => doc.id));
    }
  }
}
