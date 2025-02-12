import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/router/router.dart';
import 'package:test_pixelfield/core/theme/app_colors.dart';

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
