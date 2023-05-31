import 'package:ecommerce_flutter/src/core/config/app_sizes.dart';
import 'package:ecommerce_flutter/src/core/config/colors.dart';
import 'package:ecommerce_flutter/src/core/di/service_locator.dart';
import 'package:ecommerce_flutter/src/core/routes/route_refresh_notifier.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _onAppStart();
    super.initState();
  }

  void _onAppStart() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    await serviceLocator.get<RouteRefreshNotifier>().onAppStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'E-commerce',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            gapH12,
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
