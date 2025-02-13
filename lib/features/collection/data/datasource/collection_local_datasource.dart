import 'package:hive/hive.dart';
import 'package:test_pixelfield/core/models/bottle.dart';

abstract interface class CollectionLocalDataSource {
  Future<void> cacheCollection(List<Bottle> bottles);
  Future<List<Bottle>> getCachedCollection();
}

class CollectionLocalDataSourceImpl implements CollectionLocalDataSource {
  final Box<Bottle> collectionBox;

  CollectionLocalDataSourceImpl(this.collectionBox);

  @override
  Future<void> cacheCollection(List<Bottle> bottles) async {
    await collectionBox.clear();
    await collectionBox.addAll(bottles);
  }

  @override
  Future<List<Bottle>> getCachedCollection() async {
    return collectionBox.values.toList();
  }
}
