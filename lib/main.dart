import 'package:ecommerce_flutter/src/core/config/theme.dart';
import 'package:ecommerce_flutter/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp.router(
      title: 'Flutter Ecommerce',
      theme: AppTheme.dark,
      routerConfig: appRouter.router,
    );
  }
}
