import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/core/presentation/pages/in_progress.dart';
import 'package:test_pixelfield/features/auth/presentation/pages/home_page.dart';
import 'package:test_pixelfield/features/auth/presentation/pages/login_page.dart';
import 'package:test_pixelfield/features/auth/presentation/pages/welcome_page.dart';
import 'package:test_pixelfield/features/collection/presentation/pages/details_page.dart';
import 'package:test_pixelfield/features/collection/presentation/pages/my_collection_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        initial: true,
        page: WelcomeRoute.page,
        title: (_, __) => 'Welcome',
        path: '/',
      ),
      AutoRoute(
        page: LoginRoute.page,
        title: (_, __) => 'Login',
        path: '/login',
      ),
      AutoRoute(page: HomeRoute.page, path: '/home', children: [
        AutoRoute(
          path: 'my-collections',
          title: (_, __) => 'My collections',
          initial: true,
          page: MyCollectionRoute.page,
        ),
        AutoRoute(
          path: 'progress',
          page: InProgressRoute.page,
        ),
      ]),
      AutoRoute(
        path: '/details',
        page: DetailsRoute.page,
      ),
      AutoRoute(
        path: '/progress',
        page: InProgressRoute.page,
      ),
    ];
  }
}
