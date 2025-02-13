import 'package:test_pixelfield/features/collection/domain/repositories/collection_repository.dart';
import 'package:test_pixelfield/core/models/bottle.dart';

class GetCollectionUseCase {
  final CollectionRepository repository;

  GetCollectionUseCase(this.repository);

  Future<List<Bottle>> call(String collectionId) {
    return repository.getCollection(collectionId);
  }
}
