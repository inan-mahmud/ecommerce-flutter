import 'dart:async';

import 'package:ecommerce_flutter/app.dart';
import 'package:ecommerce_flutter/src/core/di/service_locator.dart';
import 'package:ecommerce_flutter/src/flavors/app_environment.dart';
import 'package:ecommerce_flutter/src/flavors/build_config.dart';
import 'package:ecommerce_flutter/src/flavors/env_config.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  EnvConfig prodConfig = EnvConfig(
    appName: "Ecommerce",
    baseUrl: "https://fakestoreapi.com/",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: AppEnvironment.prod,
    envConfig: prodConfig,
  );
  await setUpLocators();
  runApp(const EcommerceApp());
}
