import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/router/router.dart';

import 'package:test_pixelfield/core/theme/app_colors.dart';
import 'package:test_pixelfield/core/widgets/page_wrapper.dart';
import 'package:test_pixelfield/core/widgets/title.dart';
import 'package:test_pixelfield/features/auth/presentation/widgets/label_button.dart';
import 'package:test_pixelfield/features/auth/presentation/widgets/primary_button.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      withBg: true,
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
                TitleWidget(text: 'Welcome'),
                TitleWidget.subtitle(text: 'Text text text'),
              ],
            ),
            Hero(
              tag: 'button',
              child: PrimaryButtonWidget(text: 'Scan bottle'),
            ),
            LabelButtonWidget(
              text: 'Sign in first',
              label: 'Have an account?',
              onPressed: () => context.router.push(LoginRoute()),
            )
          ],
        ),
      ),
    );
  }
}

