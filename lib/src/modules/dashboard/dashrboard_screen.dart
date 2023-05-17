import 'package:ecommerce_flutter/src/core/config/colors.dart';
import 'package:ecommerce_flutter/src/core/routes/routes.dart';
import 'package:ecommerce_flutter/src/modules/dashboard/app_bottom_bar.dart';
import 'package:ecommerce_flutter/src/modules/dashboard/bottom_bar_item.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  final Widget child;
  const DashboardScreen({
    super.key,
    required this.child,
  });

  @override
  State<StatefulWidget> createState() {
    return _DashboardScreenState();
  }
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: AppBottomNavigationBar(
        tabs: [
          BottomBarItem(
              initialLocation: Routes.home.path,
              actvIcon: const Icon(
                Icons.home,
                color: AppColors.whiteColor,
              ),
              inactiveIcon: const Icon(
                Icons.home,
                color: AppColors.greyColor,
              ),
              title: 'Home'),
          BottomBarItem(
              initialLocation: Routes.cart.path,
              actvIcon: const Icon(
                Icons.shopping_cart,
                color: AppColors.whiteColor,
              ),
              inactiveIcon: const Icon(
                Icons.shopping_cart,
                color: AppColors.greyColor,
              ),
              title: 'Cart'),
          BottomBarItem(
              initialLocation: Routes.settings.path,
              actvIcon: const Icon(
                Icons.settings,
                color: AppColors.whiteColor,
              ),
              inactiveIcon: const Icon(
                Icons.settings,
                color: AppColors.greyColor,
              ),
              title: 'Settings'),
        ],
      ),
    );
  }
}
