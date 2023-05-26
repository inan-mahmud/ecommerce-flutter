import 'package:ecommerce_flutter/src/core/config/app_sizes.dart';
import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/routes/route_refresh_notifier.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final RouteRefreshNotifier _notifier = locator.get<RouteRefreshNotifier>();

  @override
  void initState() {
    onStart();
    super.initState();
  }

  void onStart() async {
    await _notifier.onAppStart();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: locator.allReady(),
        builder: (context, snapshot) {
          print(snapshot.hasData);
          return const Scaffold(
            body: Center(
              child: Column(
                children: [
                  Text('E-commerce'),
                  gapH12,
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        });
  }
}
