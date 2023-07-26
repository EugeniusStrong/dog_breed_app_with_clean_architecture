import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/error/exception.dart';
import '../models/dog_model.dart';

abstract class DogLocalDataSource {
  Future<List<DogModel>> getLastDogsFromCache();

  Future<void> dogsToCache(List<DogModel> dogs);
}

const keyForCachedDogsList = 'CACHED_DOGS_LIST';

class DogLocalDataSourceImpl implements DogLocalDataSource {
  final SharedPreferences sharedPreferences;

  DogLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<DogModel>> getLastDogsFromCache() {
    final jsonDogsList = sharedPreferences.getStringList(keyForCachedDogsList);
    if (jsonDogsList!.isNotEmpty) {
      return Future.value(jsonDogsList
          .map((dog) => DogModel.fromJson(json.decode(dog)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> dogsToCache(List<DogModel> dogs) {
    final List<String> jsonDogsList =
        dogs.map((dog) => json.encode(dog.toJson())).toList();
    sharedPreferences.setStringList(keyForCachedDogsList, jsonDogsList);
    debugPrint('Dogs to write Cache: ${jsonDogsList.length}');
    // ignore: void_checks
    return Future.value(jsonDogsList);
  }
}
