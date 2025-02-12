import 'package:auto_route/auto_route.dart';
import 'package:test_pixelfield/features/auth/presentation/pages/welcome_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, initial: true),
        
      ];
}
