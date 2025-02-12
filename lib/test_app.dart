import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/router/router.dart';

class TestApp extends StatelessWidget {
  final AppRouter appRouter;

  const TestApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
    );
  }
}
