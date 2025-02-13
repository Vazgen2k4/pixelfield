import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/core/models/details.dart';
import 'package:test_pixelfield/core/models/history.dart';
import 'package:test_pixelfield/core/models/tasting_note.dart';
import 'package:test_pixelfield/core/router/router.dart';
import 'package:test_pixelfield/core/services/bottle_service.dart';
import 'package:test_pixelfield/features/collection/data/datasource/collection_local_datasource.dart';
import 'package:test_pixelfield/features/collection/data/datasource/collection_remote_datasource.dart';
import 'package:test_pixelfield/features/collection/data/repositories/collection_repository_impl.dart';
import 'package:test_pixelfield/features/collection/domain/usecases/get_bottle_by_number.dart';
import 'package:test_pixelfield/features/collection/domain/usecases/get_collection.dart';
import 'package:test_pixelfield/test_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  await Hive.initFlutter();

  Hive.registerAdapter(BottleAdapter());
  Hive.registerAdapter(DetailsAdapter());
  Hive.registerAdapter(HistoryAdapter());
  Hive.registerAdapter(TastingNoteAdapter());

  final bottleBox = await Hive.openBox<Bottle>(BottleService.boxName);

  final remoteDataSource = CollectionRemoteDataSourceImpl();
  final localDataSource = CollectionLocalDataSourceImpl(bottleBox);
  final connectivity = Connectivity();

  final collectionRepository = CollectionRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    connectivity: connectivity,
  );

  final appRouter = AppRouter();

  final getCollectionUseCase = GetCollectionUseCase(collectionRepository);
  final getBottleByNumberUseCase =
      GetBottleByNumberUseCase(collectionRepository);

  runApp(
    TestApp(
      params: TestAppParams(
        appRouter: appRouter,
        getCollectionUseCase: getCollectionUseCase,
        getBottleByNumberUseCase: getBottleByNumberUseCase,
        collectionRepository: collectionRepository,
        connectivity: connectivity,
      ),
    ),
  );
}
