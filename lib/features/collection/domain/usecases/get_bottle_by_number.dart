import 'package:test_pixelfield/features/collection/domain/repositories/collection_repository.dart';
import 'package:test_pixelfield/core/models/bottle.dart';

class GetBottleByNumberUseCase {
  final CollectionRepository repository;

  GetBottleByNumberUseCase(this.repository);

  Future<List<Bottle>> call(String bottleNumber) {
    return repository.getBottleByNumber(bottleNumber);
  }
}
