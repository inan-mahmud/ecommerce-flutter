import 'dart:async';

import 'package:ecommerce_flutter/src/core/di/locator.dart';
import 'package:ecommerce_flutter/src/core/routes/not_found_screen.dart';
import 'package:ecommerce_flutter/src/core/routes/route_refresh_notifier.dart';
import 'package:ecommerce_flutter/src/core/routes/routes.dart';
import 'package:ecommerce_flutter/src/modules/auth/view/screens/login_screen.dart';
import 'package:ecommerce_flutter/src/modules/cart/cart_screen.dart';
import 'package:ecommerce_flutter/src/modules/dashboard/dashrboard_screen.dart';
import 'package:ecommerce_flutter/src/modules/home/home_screen.dart';
import 'package:ecommerce_flutter/src/modules/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum NavigatorKey { root, shell }

class AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.root.name);
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: NavigatorKey.shell.name);
  final RouteObserver<PageRoute> _routeObserver = RouteObserver<PageRoute>();

  late GoRouter _router;

  final _refreshNotifier = locator.get<RouteRefreshNotifier>();

  AppRouter() {
    _router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.home.path,
      debugLogDiagnostics: true,
      refreshListenable: _refreshNotifier,
      observers: [
        _routeObserver,
      ],
      redirect: ((context, state) {
        final isLoggedIn = _refreshNotifier.loginState;

        final matchedLocation = state.matchedLocation;

        if (!isLoggedIn) {
          return matchedLocation == '/login' ? null : '/login';
        } else {
          return matchedLocation == '/login' ? '/home' : null;
        }
      }),
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) => DashboardScreen(
                  child: child,
                ),
            routes: [
              GoRoute(
                path: Routes.home.path,
                name: Routes.home.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    name: state.path,
                    child: HomeScreen(
                      key: state.pageKey,
                    ),
                  );
                },
              ),
              GoRoute(
                path: Routes.cart.path,
                name: Routes.cart.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    name: state.path,
                    child: CartScreen(
                      key: state.pageKey,
                    ),
                  );
                },
              ),
              GoRoute(
                path: Routes.settings.path,
                name: Routes.settings.name,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    name: state.path,
                    child: SettingsScreen(
                      key: state.pageKey,
                    ),
                  );
                },
              ),
            ]),
        GoRoute(
          path: Routes.login.path,
          parentNavigatorKey: _rootNavigatorKey,
          name: Routes.login.name,
          pageBuilder: ((context, state) {
            return MaterialPage(
              key: state.pageKey,
              fullscreenDialog: true,
              child: const LoginScreen(),
            );
          }),
        ),
      ],
      errorBuilder: (context, state) => const NotFoundScreen(),
    );
  }
  FutureOr<String?> _handleRedirect(BuildContext context, GoRouterState state) {
    final loginLocation = state.namedLocation(Routes.login.path);
    final homeLocation = state.namedLocation(Routes.home.path);
    final isLoggedIn = _refreshNotifier.loginState;

    final matchedLocation = state.matchedLocation;

    if (!isLoggedIn) {
      return matchedLocation == '/login' ? null : '/login';
    } else {
      return matchedLocation == '/login' ? '/home' : null;
    }
  }

  GoRouter get router => _router;

  GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

  GlobalKey<NavigatorState> get shellNavigatorKey => _shellNavigatorKey;

  RouteObserver<PageRoute> get routeObserver => _routeObserver;
}
