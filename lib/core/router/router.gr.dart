// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [DetailsPage]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    Key? key,
    required Bottle bottle,
    required int index,
    required int bottlesCount,
    List<PageRouteInfo>? children,
  }) : super(
         DetailsRoute.name,
         args: DetailsRouteArgs(
           key: key,
           bottle: bottle,
           index: index,
           bottlesCount: bottlesCount,
         ),
         initialChildren: children,
       );

  static const String name = 'DetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DetailsRouteArgs>();
      return DetailsPage(
        key: args.key,
        bottle: args.bottle,
        index: args.index,
        bottlesCount: args.bottlesCount,
      );
    },
  );
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.bottle,
    required this.index,
    required this.bottlesCount,
  });

  final Key? key;

  final Bottle bottle;

  final int index;

  final int bottlesCount;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, bottle: $bottle, index: $index, bottlesCount: $bottlesCount}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [InProgressPage]
class InProgressRoute extends PageRouteInfo<void> {
  const InProgressRoute({List<PageRouteInfo>? children})
    : super(InProgressRoute.name, initialChildren: children);

  static const String name = 'InProgressRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InProgressPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [MyCollectionPage]
class MyCollectionRoute extends PageRouteInfo<void> {
  const MyCollectionRoute({List<PageRouteInfo>? children})
    : super(MyCollectionRoute.name, initialChildren: children);

  static const String name = 'MyCollectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyCollectionPage();
    },
  );
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomePage();
    },
  );
}
