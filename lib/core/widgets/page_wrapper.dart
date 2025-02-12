import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/resources/resources.dart';

class PageWrapper extends StatelessWidget {
  final PageWrapperType _type;

  final bool withBg;
  final Widget child;
  final AlignmentGeometry? alignment;
  final String? title;

  final List<PageRouteInfo<dynamic>>? routes;
  final List<BottomNavigationBarItem> bottomNavigationItems;

  const PageWrapper({
    super.key,
    this.withBg = false,
    required this.child,
    this.alignment,
    this.title,
  })  : _type = PageWrapperType.classic,
        routes = null,
        bottomNavigationItems = const [];

  const PageWrapper.tabs({
    super.key,
    this.withBg = false,
    this.alignment,
    this.title,
    required this.child,
    required this.routes,
    required this.bottomNavigationItems,
  }) : _type = PageWrapperType.tabs;

  @override
  Widget build(BuildContext context) {
    final image = withBg
        ? DecorationImage(
            image: AssetImage(AppImages.bg),
            fit: BoxFit.cover,
          )
        : null;

    switch (_type) {
      case PageWrapperType.classic:
        return _buildClassic(context, image);
      case PageWrapperType.tabs:
        return _buildTabs(context, image);
    }
  }

  Widget? _buildTitle() {
    if (title == null) {
      return null;
    }

    return Text(
      '$title',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildClassic(BuildContext context, DecorationImage? image) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _buildTitle(),
      ),
      body: _buildBody(context, image),
    );
  }

  Widget _buildBody(BuildContext context, DecorationImage? image) {
    return Container(
      decoration: BoxDecoration(image: image),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      alignment: alignment,
      child: SafeArea(child: child),
    );
  }

  Widget _buildTabs(BuildContext context, DecorationImage? image) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) {
        return AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: _buildTitle(),
        );
      },
      routes: routes,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: bottomNavigationItems,
        );
      },
    );
  }
}

enum PageWrapperType {
  classic,
  tabs,
}
