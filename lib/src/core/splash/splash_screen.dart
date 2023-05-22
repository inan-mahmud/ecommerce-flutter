import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/routes/route_refresh_notifier.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late RouteRefreshNotifier _notifier;
  @override
  void initState() {
    _notifier = locator.get<RouteRefreshNotifier>();
    onStart();
    super.initState();
  }

  void onStart() async {
    await _notifier.onAppStart();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('E-commerce App'),
      ),
    );
  }
}
