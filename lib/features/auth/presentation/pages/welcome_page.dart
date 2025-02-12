import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:test_pixelfield/core/resources/resources.dart';
import 'package:test_pixelfield/core/theme/app_colors.dart';
import 'package:test_pixelfield/features/auth/presentation/widgets/label_button.dart';
import 'package:test_pixelfield/features/auth/presentation/widgets/primary_button.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackSecondary,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.bg),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            color: AppColors.blackPrimary,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 24.0,
              children: <Widget>[
                Column(
                  spacing: 8.0,
                  children: [
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        color: AppColors.greyPrimary,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        height: 40 / 32,
                      ),
                    ),
                    Text(
                      'Text text text',
                      style: TextStyle(
                        color: AppColors.greyPrimary,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        height: 24 / 16,
                        letterSpacing: 32 * 0.005,
                      ),
                    ),
                  ],
                ),
                PrimaryButtonWidget(text: 'Scan bottle'),
                LabelButton (
                  text: 'Sign in first',
                  label: 'Have an account?',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
