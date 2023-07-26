import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/error/exception.dart';
import '../models/dog_model.dart';

abstract class DogRemoteDataSources {
  Future<List<DogModel>> getAllDogs(int page);
}

class DogRemoteDataSourcesImpl implements DogRemoteDataSources {
  final http.Client client;

  DogRemoteDataSourcesImpl({required this.client});

  @override
  Future<List<DogModel>> getAllDogs(int page) => _getPersonFromUrl(
      'https://api.thedogapi.com/v1/breeds?limit=10&page=$page');

  Future<List<DogModel>> _getPersonFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    debugPrint('response: ${response.body}');
    if (response.statusCode == 200) {
      final dogs = json.decode(response.body);
      return (dogs as List).map((dog) => DogModel.fromJson(dog)).toList();
    } else {
      throw ServerException();
    }
  }
}
