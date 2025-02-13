import 'package:test_pixelfield/core/models/bottle.dart';

abstract interface class CollectionRepository {
  

  
  Future<List<Bottle>> getCollection(String collectionId);
  Future<List<Bottle>> getBottleByNumber(String collectionId);
}
