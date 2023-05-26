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
  @override
  void initState() {
    _onAppStart();
    super.initState();
  }

  void _onAppStart() async {
    await locator.get<RouteRefreshNotifier>().onAppStart();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Ecommerce',
      theme: AppTheme.light,
      routerConfig: locator.get<AppRouter>().router,
    );
  }
}
