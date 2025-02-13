import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/core/resources/resources.dart';

abstract interface class CollectionRemoteDataSource {
  Future<List<Bottle>> fetchCollection();
}

class CollectionRemoteDataSourceImpl implements CollectionRemoteDataSource {
  @override
  Future<List<Bottle>> fetchCollection() async {
    final jsonString = await rootBundle.loadString(AppMocks.bottles);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Bottle.fromJson(json)).toList();
  }
}
