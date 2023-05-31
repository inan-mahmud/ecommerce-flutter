import 'package:ecommerce_flutter/src/core/routes/app_router.dart';
import 'package:flutter/material.dart';

abstract class NavigatorKeys {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.root.name);
  static final GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.home.name);
  static final GlobalKey<NavigatorState> cartNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.cart.name);
  static final GlobalKey<NavigatorState> settingsNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.settings.name);

}
