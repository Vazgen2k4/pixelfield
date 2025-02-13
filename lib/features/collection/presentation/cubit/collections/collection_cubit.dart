import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/features/collection/domain/usecases/get_bottle_by_number.dart';
import 'package:test_pixelfield/features/collection/domain/usecases/get_collection.dart';

part 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  final GetCollectionUseCase getCollectionUseCase;
  final GetBottleByNumberUseCase getBottleByNumberUseCase;

  CollectionCubit({
    required this.getCollectionUseCase,
    required this.getBottleByNumberUseCase,
  }) : super(CollectionInitial());

  Future<void> fetchCollection(String collectionId) async {
    emit(CollectionLoading());
    try {
      final collection = await getCollectionUseCase(collectionId);
      emit(CollectionLoaded(collection));
    } catch (e) {
      emit(CollectionError(e.toString()));
    }
  }

  Future<void> fetchBottleByNumber(String bottleNumber) async {
    emit(CollectionLoading());
    try {
      final bottle = await getBottleByNumberUseCase(bottleNumber);
      emit(CollectionLoaded(bottle));
    } catch (e) {
      emit(CollectionError(e.toString()));
    }
  }
}