import 'package:ecommerce_flutter/src/core/config/app_sizes.dart';
import 'package:ecommerce_flutter/src/core/config/colors.dart';
import 'package:ecommerce_flutter/src/modules/dashboard/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class AppBottomNavigationBar extends StatefulWidget {
  final List<BottomBarItem> tabs;
  const AppBottomNavigationBar({super.key, required this.tabs});

  @override
  State<AppBottomNavigationBar> createState() =>
      _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState
    extends State<AppBottomNavigationBar> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.backgroundColor,
      currentIndex: _currentIndex,
      onTap: (value) => _onItemTapped(context, value),
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.greyColor,
      selectedLabelStyle: const TextStyle(
        color: AppColors.whiteColor,
        fontSize: Sizes.p14,
        fontWeight: FontWeight.w500,
      ),
      items: widget.tabs,
    );
  }

  int _locationToTabIndex(String location) {
    final index =
        widget.tabs.indexWhere((t) => location.startsWith(t.initialLocation));

    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(widget.tabs[tabIndex].initialLocation);
    }
  }
}
