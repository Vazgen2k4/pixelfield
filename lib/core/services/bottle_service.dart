import 'package:hive/hive.dart';
import 'package:test_pixelfield/core/models/bottle.dart';

class BottleService {
  static const String boxName = 'bottlesBox';
  Box<Bottle>? _bottleBox;

  Future<void> init() async {
    _bottleBox = await Hive.openBox<Bottle>(boxName);
  }

  void _checkInitialization() {
    if (_bottleBox == null) {
      throw Exception('BottleService not initialized. Call init() first.');
    }
  }

  Future<void> saveBottles(List<Bottle> bottles) async {
    _checkInitialization();
    await _bottleBox!.clear();
    for (var i = 0; i < bottles.length; i++) {
      await _bottleBox!.put(i, bottles[i]);
    }
  }

  List<Bottle> loadBottles() {
    _checkInitialization();
    return _bottleBox!.values.toList();
  }

  Future<void> addBottle(Bottle bottle) async {
    _checkInitialization();
    await _bottleBox!.add(bottle);
  }

  Future<void> removeBottle(String bottleNumber) async {
    _checkInitialization();
    final bottles = loadBottles();
    final index =
        bottles.indexWhere((bottle) => bottle.bottleNumber == bottleNumber);
    if (index != -1) {
      await _bottleBox!.deleteAt(index);
    }
  }

  Future<void> clearBottles() async {
    _checkInitialization();
    await _bottleBox!.clear();
  }

  Future<void> close() async {
    _checkInitialization();
    await _bottleBox!.close();
  }
}
