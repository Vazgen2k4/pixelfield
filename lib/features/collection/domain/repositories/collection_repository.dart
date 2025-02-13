import 'package:test_pixelfield/core/models/bottle.dart';

abstract interface class CollectionRepository {
  Future<List<Bottle>> getCollection();
  Future<List<Bottle>> getBottleByNumber(String bottleNumber);
}
