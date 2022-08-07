import 'dart:developer';

import 'package:root_package/packages/cloud_firestore.dart';
import 'package:root_package/packages/injectable.dart';

import '../../../../core/failures/address_suggestion/params.dart';
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
        .where('governate', isGreaterThanOrEqualTo: params.searchText)
        .where('governate', isLessThanOrEqualTo: params.searchText + "~")
        .orderBy('governate')
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
        .where('city', isGreaterThanOrEqualTo: params.searchText)
        .where('city', isLessThanOrEqualTo: params.searchText + "~")
        .orderBy('city')
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
        .where('neighborhood', isGreaterThanOrEqualTo: params.searchText)
        .where('neighborhood', isLessThanOrEqualTo: params.searchText + "~")
        .orderBy('neighborhood')
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
        .where('governate', isEqualTo: params.governate)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return RefGovernateModel.fromFirestore(snapshot.docs.first);
    } else {
      final doc = collection.doc();

      final mapData = {
        'country': params.country,
        'governate': params.governate,
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
        .where('governate', isEqualTo: params.refGovernate.governate)
        .where('city', isEqualTo: params.city)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return RefCityModel.fromFirestore(snapshot.docs.first);
    } else {
      final doc = collection.doc();

      final mapData = {
        'country': params.country,
        'governate': params.refGovernate.governate,
        'city': params.city
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
        .where('governate', isEqualTo: params.refGovernate.governate)
        .where('city', isEqualTo: params.refCity.city)
        .where('neighborhood', isEqualTo: params.neighborhood)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return RefNeighborhoodModel.fromFirestore(snapshot.docs.first);
    } else {
      final doc = collection.doc();

      final mapData = {
        'country': params.country,
        'governate': params.refGovernate.governate,
        'city': params.refCity.city,
        'neighborhood': params.neighborhood
      };
      await doc.set(mapData);
      return RefNeighborhoodModel.fromJson(
          mapData..putIfAbsent('id', () => doc.id));
    }
  }
}

class FirestorePath {
  static String refGovernates = 'refGovernates';
  static String refCities = 'refCities';
  static String refNeighborhoods = 'refNeighborhoods';
}