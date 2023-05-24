import 'package:ecommerce_flutter/src/core/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  final String categoriesPath;

  const HomeScreen({super.key, required this.categoriesPath});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('Categories'),
            gapH16,
            TextButton(
              onPressed: () {
                context.go(widget.categoriesPath);
              },
              child: const Text('View details'),
            ),
          ],
        ),
      ),
    );
  }
}
