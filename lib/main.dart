import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/core/models/details.dart';
import 'package:test_pixelfield/core/models/history.dart';
import 'package:test_pixelfield/core/models/tasting_note.dart';
import 'package:test_pixelfield/core/router/router.dart';
import 'package:test_pixelfield/core/services/bottle_service.dart';
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

  await Hive.openBox<Bottle>(BottleService.boxName);

  final appRouter = AppRouter();

  runApp(TestApp(appRouter: appRouter));
}
