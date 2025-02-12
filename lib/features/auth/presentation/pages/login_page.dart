import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/router/router.dart';
import 'package:test_pixelfield/core/widgets/page_wrapper.dart';
import 'package:test_pixelfield/core/widgets/title.dart';
import 'package:test_pixelfield/features/auth/presentation/widgets/label_button.dart';
import 'package:test_pixelfield/features/auth/presentation/widgets/primary_button.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 40,
          children: <Widget>[
            TitleWidget(text: 'Sign in'),
            
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility_outlined),
              ),
            ),
            Hero(
              tag: 'button',
              child: PrimaryButtonWidget(
                onPressed: () => context.router.replaceAll([HomeRoute()]),
                text: 'Continue',
              ),
            ),
            LabelButtonWidget(
              label: 'Can’t sign in?',
              text: 'Recover password',
            ),
          ],
        ),
      ),
    );
  }
}
