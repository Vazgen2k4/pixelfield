import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';

abstract class AppThemes {
  const AppThemes._();

  static final kDarkTheme = ThemeData.dark(
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
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.blackSecondary,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.greyUnselected,
      selectedLabelStyle: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 16 / 12,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.greyPrimary,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 16 / 12,
      ),
    ),
  );
}
