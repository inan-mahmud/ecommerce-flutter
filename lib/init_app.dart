import 'dart:async';

import 'package:ecommerce_flutter/app.dart';
import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void initApp() {
  runZonedGuarded(
      () => SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]).then((_) async {
            SharedPreferences.getInstance().then((prefs) {
              initializeCache(prefs);
              runApp(const EcommerceApp());
            });
          }), (error, stack) {
    //send crash report to firebase or sentry
  });
}
