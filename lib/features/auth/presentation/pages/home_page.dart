import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pixelfield/core/router/router.dart';
import 'package:test_pixelfield/core/presentation/widgets/page_wrapper.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<_HomeBottomItems> _bottomItems = const [
    _HomeBottomItems(
      icon: Icons.qr_code_scanner,
      label: 'Scan',
    ),
    _HomeBottomItems(
      icon: Icons.grid_view_outlined,
      label: 'Collection',
    ),
    _HomeBottomItems(
      icon: Icons.shopping_bag_outlined,
      label: 'Shop',
    ),
    _HomeBottomItems(
      icon: Icons.settings_outlined,
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageWrapper.tabs(
      homeIndex: 1,
      routes: [
        InProgressRoute(),
        MyCollectionRoute(),
        InProgressRoute(),
        InProgressRoute(),
      ],
      bottomNavigationItems: _bottomItems.map(_buildBottomItem).toList(),
      child: SingleChildScrollView(
        child: Text('Home page'),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomItem(_HomeBottomItems item) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Icon(item.icon),
      ),
      label: item.label,
    );
  }
}

class _HomeBottomItems {
  final IconData icon;
  final String label;

  const _HomeBottomItems({
    required this.icon,
    required this.label,
  });
}
