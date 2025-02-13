import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/router/router.dart';
import 'package:test_pixelfield/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pixelfield/features/collection/domain/repositories/collection_repository.dart';
import 'package:test_pixelfield/features/collection/domain/usecases/get_bottle_by_number.dart';
import 'package:test_pixelfield/features/collection/domain/usecases/get_collection.dart';
import 'package:test_pixelfield/features/collection/presentation/cubit/collections/collection_cubit.dart';
import 'package:test_pixelfield/features/collection/presentation/cubit/connectivity/connectivity_cubit.dart';

class TestApp extends StatelessWidget {
  final TestAppParams params;
  const TestApp({
    super.key,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CollectionCubit(
            getCollectionUseCase: params.getCollectionUseCase,
            getBottleByNumberUseCase: params.getBottleByNumberUseCase,
          ),
        ),
        BlocProvider(
          create: (context) => ConnectivityCubit(params.connectivity),
        ),
      ],
      child: _AppContent(appRouter: params.appRouter),
    );
  }
}

class TestAppParams {
  final AppRouter appRouter;
  final GetCollectionUseCase getCollectionUseCase;
  final GetBottleByNumberUseCase getBottleByNumberUseCase;
  final CollectionRepository collectionRepository;
  final Connectivity connectivity;

  const TestAppParams({
    required this.appRouter,
    required this.getCollectionUseCase,
    required this.getBottleByNumberUseCase,
    required this.collectionRepository,
    required this.connectivity,
  });
}

class _AppContent extends StatelessWidget {
  const _AppContent({
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: AppColors.blackSecondary,
        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: WidgetStateColor.resolveWith((states) {
            return states.contains(WidgetState.focused)
                ? AppColors.primary
                : AppColors.greyPrimary;
          }),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary,
              width: .5,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greySecondary,
              width: .5,
            ),
          ),
          floatingLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: AppColors.primary,
          ),
          labelStyle: TextStyle(
            color: AppColors.greyPrimary,
            fontWeight: FontWeight.normal,
            fontSize: 16,
            height: 24 / 16,
          ),
        ),
      ),
      routerConfig: appRouter.config(),
    );
  }
}
