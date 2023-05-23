import 'package:ecommerce_flutter/src/core/config/theme.dart';
import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/routes/app_router.dart';
import 'package:ecommerce_flutter/src/core/routes/route_refresh_notifier.dart';
import 'package:flutter/material.dart';

class EcommerceApp extends StatefulWidget {
  const EcommerceApp({super.key});

  @override
  State<EcommerceApp> createState() => _EcommerceAppState();
}

class _EcommerceAppState extends State<EcommerceApp> {
  late RouteRefreshNotifier _notifier;

  final _appRouter = locator.get<AppRouter>();

  @override
  void initState() {
    _notifier = locator.get<RouteRefreshNotifier>();
    _onAppStart();
    super.initState();
  }

  _onAppStart() async {
    await _notifier.onAppStart();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Ecommerce',
      theme: AppTheme.dark,
      routerConfig: _appRouter.router,
    );
  }
}
