import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/router/router.dart';

import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';
import 'package:test_pixelfield/core/presentation/widgets/page_wrapper.dart';
import 'package:test_pixelfield/core/presentation/widgets/title.dart';
import 'package:test_pixelfield/features/auth/presentation/widgets/label_button.dart';
import 'package:test_pixelfield/features/auth/presentation/widgets/primary_button.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      withBg: true,
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: _offsetAnimation,
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
                child: SizedBox(
                  width: double.infinity,
                  child: PrimaryButtonWidget(text: 'Scan bottle'),
                ),
              ),
              LabelButtonWidget(
                text: 'Sign in first',
                label: 'Have an account?',
                onPressed: () => context.router.push(LoginRoute()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
