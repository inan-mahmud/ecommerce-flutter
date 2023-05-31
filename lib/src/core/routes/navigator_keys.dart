
import 'package:flutter/material.dart';

enum NavigatorKeyDebugLabel { root, home, cart, settings }

abstract class NavigatorKeys {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKeyDebugLabel.root.name);
  static final GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKeyDebugLabel.home.name);
  static final GlobalKey<NavigatorState> cartNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKeyDebugLabel.cart.name);
  static final GlobalKey<NavigatorState> settingsNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKeyDebugLabel.settings.name);

}
