import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/constants.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';
import 'package:test_pixelfield/core/resources/resources.dart';

class PageWrapper extends StatelessWidget {
  final PageWrapperType _type;

  final bool withBg;
  final Widget child;
  final Widget? floatActionButton;
  final AlignmentGeometry? alignment;
  final List<PageRouteInfo<dynamic>>? routes;
  final List<BottomNavigationBarItem> bottomNavigationItems;
  final int homeIndex;
  final FloatingActionButtonLocation floatingActionButtonLocation;

  final AppBarWrapperParams? appBarParams;

  const PageWrapper({
    super.key,
    this.withBg = false,
    this.floatActionButton,
    required this.child,
    this.alignment,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
    this.appBarParams,
  })  : _type = PageWrapperType.classic,
        routes = null,
        homeIndex = 0,
        bottomNavigationItems = const [];

  const PageWrapper.tabs({
    super.key,
    this.withBg = false,
    this.alignment,
    this.appBarParams,
    this.floatActionButton,
    required this.child,
    required this.routes,
    required this.bottomNavigationItems,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
    this.homeIndex = 0,
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

  Widget? _buildTitle(String? title) {
    if (title == null) {
      return null;
    }

    if (appBarParams?.titleIsLabel == true) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: AppColors.blackSecondary,
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.greyPrimary,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            height: 20 / 16,
          ),
        ),
      );
    }

    return Text(
      title,
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
      appBar: _buildAppBar(context, appBarParams?.title),
      body: _buildBody(context, image),
      floatingActionButton: floatActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  Widget _buildBody(BuildContext context, DecorationImage? image) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(image: image),
      padding: EdgeInsets.fromLTRB(16,0,16,16),
      alignment: alignment,
      child: SafeArea(child: child),
    );
  }

  Widget _buildTabs(BuildContext context, DecorationImage? image) {
    return AutoTabsScaffold(
      floatingActionButtonLocation: floatingActionButtonLocation,
      homeIndex: homeIndex,
      appBarBuilder: (context, tabsRouter) => _buildAppBar(
        context,
        tabsRouter.current.title(context),
      ),
      floatingActionButton: floatActionButton,
      routes: routes,
      bottomNavigationBuilder: (_, tabsRouter) {
        return SizedBox(
          height: kBottomBarHeight,
          child: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: bottomNavigationItems,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, String? title) {
    if (appBarParams == null) {
      return AppBar(
        title: _buildTitle(title),
      );
    }

    final params = appBarParams as AppBarWrapperParams;

    return AppBar(
      toolbarHeight: params.toolbarHeight,
      title: _buildTitle(title),
      actions: params.actions,
      automaticallyImplyLeading: params.automaticallyImplyLeading,
    );
  }
}

enum PageWrapperType {
  classic,
  tabs,
}

class AppBarWrapperParams {
  final String? title;
  final bool titleIsLabel;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final double toolbarHeight;

  const AppBarWrapperParams({
    this.title,
    this.actions,
    this.titleIsLabel = false,
    this.toolbarHeight = kToolbarHeight,
    this.automaticallyImplyLeading = true,
  });
}
