import 'package:auto_route/auto_route.dart';
import 'package:test_pixelfield/features/auth/presentation/pages/home_page.dart';
import 'package:test_pixelfield/features/auth/presentation/pages/login_page.dart';
import 'package:test_pixelfield/features/auth/presentation/pages/welcome_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: WelcomeRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          children: [
          ]
        ),
      ];
}
