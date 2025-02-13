import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/models/bottle.dart';
import 'package:test_pixelfield/core/presentation/theme/app_colors.dart';
import 'package:test_pixelfield/features/collection/presentation/widgets/details_tab_content.dart';
import 'package:test_pixelfield/features/collection/presentation/widgets/history_tab_content.dart';
import 'package:test_pixelfield/features/collection/presentation/widgets/notes_tab_content.dart';

class DetailsTabBar extends StatefulWidget {
  final Bottle bottle;
  const DetailsTabBar({
    super.key,
    required this.bottle,
  });

  @override
  State<DetailsTabBar> createState() => _DetailsTabBarState();
}

class _DetailsTabBarState extends State<DetailsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.blackSecondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TabBar(
            controller: _tabController,
            onTap: _onClickTab,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            labelColor: AppColors.blackSecondary,
            unselectedLabelColor: AppColors.greyPrimary,
            dividerColor: Colors.transparent,
            tabs: [
              _buildTab("Details"),
              _buildTab("Notes"),
              _buildTab("History"),
            ],
          ),
        ),
        const SizedBox(height: 24),
        AnimatedSize(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: _buildTabContent(_tabController.index),
        ),
      ],
    );
  }

  void _onClickTab(int index) {
    _tabController.animateTo(index);
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return DetailsTabContent(widget.bottle);
      case 1:
        return NotesTabContent(widget.bottle);
      case 2:
        return HistoryTabContent(widget.bottle.history);
      default:
        return const SizedBox.shrink();
    }
  }

  static Widget _buildTab(String text) {
    return Container(
      padding: const EdgeInsets.all(6),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
