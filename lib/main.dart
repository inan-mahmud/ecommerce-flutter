import 'package:ecommerce_flutter/src/core/config/theme.dart';
import 'package:ecommerce_flutter/src/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ecommerce',
      theme: AppTheme.dark,
      home: const HomeScreen(),
    );
  }
}
