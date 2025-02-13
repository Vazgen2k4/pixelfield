import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/features/collection/data/datasource/collection_local_datasource.dart';
import 'package:test_pixelfield/features/collection/data/datasource/collection_remote_datasource.dart';
import 'package:test_pixelfield/features/collection/domain/repositories/collection_repository.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionRemoteDataSource remoteDataSource;
  final CollectionLocalDataSource localDataSource;
  final Connectivity connectivity;

  CollectionRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<List<Bottle>> getCollection(String collectionId) async {
    if (await _hasInternetConnection()) {
      final collection = await remoteDataSource.fetchCollection();
      await localDataSource.cacheCollection(collection);
      return collection;
    }

    return localDataSource.getCachedCollection();
  }

  @override
  Future<List<Bottle>> getBottleByNumber(String collectionId) async {
    final collection = await getCollection(collectionId);
    return collection
        .where((bottle) => bottle.bottleNumber == collectionId)
        .toList();
  }

  Future<bool> _hasInternetConnection() async {
    final connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }
}
