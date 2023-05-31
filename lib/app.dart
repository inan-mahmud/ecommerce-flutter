import 'package:ecommerce_flutter/src/core/config/theme.dart';
import 'package:ecommerce_flutter/src/core/di/service_locator.dart';
import 'package:ecommerce_flutter/src/core/routes/app_router.dart';
import 'package:ecommerce_flutter/src/core/routes/not_found_screen.dart';

import 'package:flutter/material.dart';

class EcommerceApp extends StatefulWidget {
  const EcommerceApp({super.key});

  @override
  State<EcommerceApp> createState() => _EcommerceAppState();
}

class _EcommerceAppState extends State<EcommerceApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: serviceLocator.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp.router(
            title: 'Flutter Ecommerce',
            theme: AppTheme.light,
            routerConfig: serviceLocator.get<AppRouter>().router,
          );
        } else if (snapshot.hasError) {
          return const NotFoundScreen();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
