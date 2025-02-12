import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:test_pixelfield/core/models/bottle.dart';

class BottleService {
  static const String _storageKey = 'bottles';

  /// Save the list of bottles to SharedPreferences
  Future<void> saveBottles(List<Bottle> bottles) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = bottles.map((bottle) => bottle.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await prefs.setString(_storageKey, jsonString);
  }

  /// Load the list of bottles from SharedPreferences
  Future<List<Bottle>> loadBottles() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_storageKey);

    if (jsonString == null) return [];

    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Bottle.fromJson(json)).toList();
  }

  /// Add a new bottle to storage
  Future<void> addBottle(Bottle bottle) async {
    final bottles = await loadBottles();
    bottles.add(bottle);
    await saveBottles(bottles);
  }

  /// Remove a bottle by its bottleNumber
  Future<void> removeBottle(String bottleNumber) async {
    final bottles = await loadBottles();
    bottles.removeWhere((bottle) => bottle.bottleNumber == bottleNumber);
    await saveBottles(bottles);
  }

  /// Clear all bottles from storage
  Future<void> clearBottles() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
}
